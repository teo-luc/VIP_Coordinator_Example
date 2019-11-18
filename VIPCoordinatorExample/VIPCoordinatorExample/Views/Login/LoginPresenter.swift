//
//  LoginPresenter.swift
//  Testnavigation
//
//  Created by Lý Gia Liêm on 11/15/19.
//  Copyright (c) 2019 Lý Gia Liêm. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    var viewController: LoginDisplayLogic? { get set }
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?

    // MARK: Do something
}
