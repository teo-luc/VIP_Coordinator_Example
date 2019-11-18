//
//  SuggestFriendRouter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit
import XCoordinator

protocol SuggestFriendRoutingLogic {
    var viewController: SuggestFriendViewController? { get set }
    var coordinator: UnownedRouter<ContactRoute>? { get set }
}

protocol SuggestFriendDataPassing {
    var dataStore: SuggestFriendDataStore? { get set }
}

class SuggestFriendRouter: NSObject, SuggestFriendRoutingLogic, SuggestFriendDataPassing {
    var coordinator: UnownedRouter<ContactRoute>?
    weak var viewController: SuggestFriendViewController?
    var dataStore: SuggestFriendDataStore?

    // MARK: Routing
}
