//
//  LoginAssembly.swift
//  Testnavigation
//
//  Created by Lý Gia Liêm on 11/15/19.
//  Copyright (c) 2019 Lý Gia Liêm. All rights reserved.
//

import Swinject

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginWorker.self) { (_) in
            return LoginWorker()
        }

        container.register((LoginBusinessLogic & LoginDataStore).self) { (resolver) in
            let interactor = LoginInteractor()
            interactor.worker = resolver.resolve(LoginWorker.self)
            return interactor
        }

        container.register(LoginPresentationLogic.self) { (_) in
            LoginPresenter()
        }

        container.register((NSObjectProtocol & LoginRoutingLogic & LoginDataPassing).self) { (_) in
            let router = LoginRouter()
            return router
        }

        container.register(LoginViewController.self) { _ in
            LoginViewController.loadFromNib()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((LoginBusinessLogic & LoginDataStore).self)
                var presenter = resolver.resolve(LoginPresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & LoginRoutingLogic & LoginDataPassing).self)
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
