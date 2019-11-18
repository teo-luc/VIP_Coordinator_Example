//
//  ContactAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class ContactAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContactWorker.self) { (_) in
            return ContactWorker()
        }

        container.register((ContactBusinessLogic & ContactDataStore).self) { (resolver) in
            let interactor = ContactInteractor()
            interactor.worker = resolver.resolve(ContactWorker.self)
            return interactor
        }

        container.register(ContactPresentationLogic.self) { (_) in
            ContactPresenter()
        }

        container.register((NSObjectProtocol & ContactRoutingLogic & ContactDataPassing).self) { (_) in
            ContactRouter()
        }

        container.register(ContactViewController.self) { _ in
            ContactViewController.loadFromNib()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((ContactBusinessLogic & ContactDataStore).self)
                var presenter = resolver.resolve(ContactPresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & ContactRoutingLogic & ContactDataPassing).self)
                viewController.title = "Contact"
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
