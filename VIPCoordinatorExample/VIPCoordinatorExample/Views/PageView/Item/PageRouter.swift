//
//  PageRouter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

@objc protocol PageRoutingLogic {
    var viewController: PageViewController? { get set }
}

protocol PageDataPassing {
    var dataStore: PageDataStore? { get set }
}

class PageRouter: NSObject, PageRoutingLogic, PageDataPassing {
    weak var viewController: PageViewController?
    var dataStore: PageDataStore?

    // MARK: Routing
}
