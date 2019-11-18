//
//  AssetCoordinator.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright © 2019 TEQ. All rights reserved.
//

import Foundation
import XCoordinator

enum FavoritesRoute: Route {
    case favorites
    case favoriteDetail
}

class FavoritesCoordinator: NavigationCoordinator<FavoritesRoute> {

    init() {
        super.init(initialRoute: .favorites)
    }
    
    override func prepareTransition(for route: FavoritesRoute) -> NavigationTransition {
        let container = AppDelegate.share.container
        switch route {
        case .favorites:
            let vc = FavoritesAssembly().resolve(container: container, FavoritesViewController.self)
            return .push(vc)
        case .favoriteDetail:
            // TODO: Logic here
            break
        }
        return .dismiss()
    }

}
