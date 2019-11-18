//
//  HomeAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeWorker.self) { (_) in
            return HomeWorker()
        }

        container.register((HomeBusinessLogic & HomeDataStore).self) { (resolver) in
            let interactor = HomeInteractor()
            interactor.worker = resolver.resolve(HomeWorker.self)
            return interactor
        }

        container.register(HomePresentationLogic.self) { (_) in
            HomePresenter()
        }

        container.register((NSObjectProtocol & HomeRoutingLogic & HomeDataPassing).self) { (_) in
            HomeRouter()
        }

        container.register(HomeViewController.self) { _ in
            HomeViewController()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((HomeBusinessLogic & HomeDataStore).self)
                var presenter = resolver.resolve(HomePresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & HomeRoutingLogic & HomeDataPassing).self)
                viewController.title = "Home"
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
