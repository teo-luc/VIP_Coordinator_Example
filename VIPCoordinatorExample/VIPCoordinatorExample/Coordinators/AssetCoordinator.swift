//
//  AssetCoordinator.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright © 2019 TEQ. All rights reserved.
//

import Foundation
import XCoordinator

enum AssetRoute: Route {
    case asset
    case assetDetail
}

class AssetCoordinator: NavigationCoordinator<AssetRoute> {

    init() {
        super.init(initialRoute: .asset)
    }
    
    override func prepareTransition(for route: AssetRoute) -> NavigationTransition {
        let container = AppDelegate.share.container
        switch route {
        case .asset:
            let vc = FavoritesAssembly().resolve(container: container, FavoritesViewController.self)
            return .push(vc)
        case .assetDetail:
            break
        }
        return .dismiss()
    }

}
