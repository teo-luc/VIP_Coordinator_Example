//
//  LoginViewController.swift
//  Testnavigation
//
//  Created by Lý Gia Liêm on 11/15/19.
//  Copyright (c) 2019 Lý Gia Liêm. All rights reserved.
//

import UIKit
import XCoordinator

protocol LoginDisplayLogic: class {
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Object lifecycle
    deinit {
        print("DEINIT - LoginViewController")
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnDidLoad()
        runTaskOnDidLoad()
    }

    // MARK: Setup
    func setupOnDidLoad() {
        
    }

    // MARK: Do something
    func runTaskOnDidLoad() {
    }
    
    @IBAction func loginAction(_ sender: Any) {
        router?.moveToHomeTab(userId: 123, firstName: "First Name", lastName: "Last Name")
    }
}
