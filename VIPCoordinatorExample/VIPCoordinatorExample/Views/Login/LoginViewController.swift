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
    var interactor : LoginBusinessLogic?
    var router     : (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var firstName : UITextField!
    @IBOutlet weak var lastName  : UITextField!

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
        //
        let firstName = self.firstName.text ?? "#FirstName"
        let lastName  = self.lastName.text ?? "#LastName"
        //
        router?.moveToHomeTab(userId: 911, firstName: firstName, lastName: lastName)
    }
}
