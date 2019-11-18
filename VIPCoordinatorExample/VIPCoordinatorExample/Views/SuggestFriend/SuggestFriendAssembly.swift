//
//  SuggestFriendAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class SuggestFriendAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SuggestFriendWorker.self) { (_) in
            return SuggestFriendWorker()
        }

        container.register((SuggestFriendBusinessLogic & SuggestFriendDataStore).self) { (resolver) in
            let interactor = SuggestFriendInteractor()
            interactor.worker = resolver.resolve(SuggestFriendWorker.self)
            return interactor
        }

        container.register(SuggestFriendPresentationLogic.self) { (_) in
            SuggestFriendPresenter()
        }

        container.register((NSObjectProtocol & SuggestFriendRoutingLogic & SuggestFriendDataPassing).self) { (_) in
            SuggestFriendRouter()
        }

        container.register(SuggestFriendViewController.self) { _ in
            SuggestFriendViewController()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((SuggestFriendBusinessLogic & SuggestFriendDataStore).self)
                var presenter = resolver.resolve(SuggestFriendPresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & SuggestFriendRoutingLogic & SuggestFriendDataPassing).self)
                viewController.title = "Suggestion"
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
