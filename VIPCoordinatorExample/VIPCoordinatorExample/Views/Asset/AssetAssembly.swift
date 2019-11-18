//
//  AssetAssembly.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import Swinject

class AssetAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AssetWorker.self) { (_) in
            return AssetWorker()
        }

        container.register((AssetBusinessLogic & AssetDataStore).self) { (resolver) in
            let interactor = AssetInteractor()
            interactor.worker = resolver.resolve(AssetWorker.self)
            return interactor
        }

        container.register(AssetPresentationLogic.self) { (_) in
            AssetPresenter()
        }

        container.register((NSObjectProtocol & AssetRoutingLogic & AssetDataPassing).self) { (_) in
            AssetRouter()
        }

        container.register(AssetViewController.self) { _ in
            AssetViewController.loadFromNib()
            }.initCompleted { (resolver, viewController) in
                var interactor = resolver.resolve((AssetBusinessLogic & AssetDataStore).self)
                var presenter = resolver.resolve(AssetPresentationLogic.self)
                var router = resolver.resolve((NSObjectProtocol & AssetRoutingLogic & AssetDataPassing).self)
                viewController.interactor = interactor
                viewController.router = router
                interactor?.presenter = presenter
                presenter?.viewController = viewController
                router?.viewController = viewController
                router?.dataStore = interactor
        }
    }
}
