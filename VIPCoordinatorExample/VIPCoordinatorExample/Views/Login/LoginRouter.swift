//
//  LoginRouter.swift
//  Testnavigation
//
//  Created by Lý Gia Liêm on 11/15/19.
//  Copyright (c) 2019 Lý Gia Liêm. All rights reserved.
//

import UIKit
import XCoordinator

protocol LoginRoutingLogic {
    var viewController: LoginViewController? { get set }
    var coordinator: UnownedRouter<ApplicationRoute>? { get set }
    func moveToHomeTab(userId: Int, firstName: String, lastName: String)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get set }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    var coordinator: UnownedRouter<ApplicationRoute>?
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    // MARK: Routing
    func moveToHomeTab(userId: Int, firstName: String, lastName: String) {
        let router = HomeTabCoordinator(userId: userId, firstName: firstName, lastName: lastName)
        coordinator?.trigger(.homeTab(router.strongRouter))
    }
}
