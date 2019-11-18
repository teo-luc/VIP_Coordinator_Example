//
//  AssetAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class FavoritesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FavoritesWorker.self) { (_) in
            return FavoritesWorker()
        }

        container.register((FavoritesBusinessLogic & FavoritesDataStore).self) { (resolver) in
            let interactor = FavoritesInteractor()
            interactor.worker = resolver.resolve(FavoritesWorker.self)
            return interactor
        }

        container.register(FavoritesPresentationLogic.self) { (_) in
            FavoritesPresenter()
        }

        container.register((NSObjectProtocol & FavoritesRoutingLogic & AssetDataPassing).self) { (_) in
            AssetRouter()
        }

        container.register(FavoritesViewController.self) { _ in
            FavoritesViewController.loadFromNib()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((FavoritesBusinessLogic & FavoritesDataStore).self)
                var presenter = resolver.resolve(FavoritesPresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & FavoritesRoutingLogic & AssetDataPassing).self)
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
