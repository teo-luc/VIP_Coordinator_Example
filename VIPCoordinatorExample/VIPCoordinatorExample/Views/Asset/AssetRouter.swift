//
//  AssetRouter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

@objc protocol AssetRoutingLogic {
    var viewController: AssetViewController? { get set }
}

protocol AssetDataPassing {
    var dataStore: AssetDataStore? { get set }
}

class AssetRouter: NSObject, AssetRoutingLogic, AssetDataPassing {
    weak var viewController: AssetViewController?
    var dataStore: AssetDataStore?

    // MARK: Routing
}
