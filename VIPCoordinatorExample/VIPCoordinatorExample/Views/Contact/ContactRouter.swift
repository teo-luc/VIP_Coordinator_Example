//
//  ContactRouter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit
import XCoordinator

protocol ContactRoutingLogic {
    var coordinator: UnownedRouter<ContactRoute>? { get set }
    var viewController: ContactViewController? { get set }
}

protocol ContactDataPassing {
    var dataStore: ContactDataStore? { get set }
}

class ContactRouter: NSObject, ContactRoutingLogic, ContactDataPassing {
    var coordinator: UnownedRouter<ContactRoute>?
    weak var viewController: ContactViewController?
    var dataStore: ContactDataStore?

    // MARK: Routing
}
