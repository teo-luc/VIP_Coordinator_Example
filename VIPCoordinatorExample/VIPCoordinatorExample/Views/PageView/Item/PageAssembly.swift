//
//  PageAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class PageAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PageWorker.self) { (_) in
            return PageWorker()
        }

        container.register((PageBusinessLogic & PageDataStore).self) { (resolver) in
            let interactor = PageInteractor()
            interactor.worker = resolver.resolve(PageWorker.self)
            return interactor
        }

        container.register(PagePresentationLogic.self) { (_) in
            PagePresenter()
        }

        container.register((NSObjectProtocol & PageRoutingLogic & PageDataPassing).self) { (_) in
            PageRouter()
        }

        container.register(PageViewController.self) { _ in
            PageViewController()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((PageBusinessLogic & PageDataStore).self)
                var presenter = resolver.resolve(PagePresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & PageRoutingLogic & PageDataPassing).self)
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
