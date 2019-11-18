//
//  LoginInteractor.swift
//  Testnavigation
//
//  Created by Lý Gia Liêm on 11/15/19.
//  Copyright (c) 2019 Lý Gia Liêm. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    var presenter: LoginPresentationLogic? { get set }
}

protocol LoginDataStore {
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?

}
