//
//  AssetRouter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

@objc protocol FavoritesRoutingLogic {
    var viewController: FavoritesViewController? { get set }
}

protocol AssetDataPassing {
    var dataStore: FavoritesDataStore? { get set }
}

class AssetRouter: NSObject, FavoritesRoutingLogic, AssetDataPassing {
    weak var viewController: FavoritesViewController?
    var dataStore: FavoritesDataStore?

    // MARK: Routing
}
