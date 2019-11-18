//
//  ContactViewController.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol ContactDisplayLogic: class {
    func displayingLogonUser(fullName: String)
}

class ContactViewController: UIViewController, ContactDisplayLogic {
    var interactor: ContactBusinessLogic?
    var router: (NSObjectProtocol & ContactRoutingLogic & ContactDataPassing)?
    
    //
    @IBOutlet weak var textLabel: UILabel!
    // MARK: Object lifecycle
    
    deinit {
        print("DEINIT - ContactViewController")
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnDidLoad()
        runTaskOnDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        directDisplayingLogonUser()
    }

    // MARK: Setup
    func setupOnDidLoad() {
    }

    // MARK: Do something
    func runTaskOnDidLoad() {
    }
    
    // MARK: - Displaying Login User Logic
    func directDisplayingLogonUser() {
        self.interactor?.directDisplayingLogonUser()
    }
    
    func displayingLogonUser(fullName: String) {
        textLabel.text = "Hello \(fullName)!"
    }
    
    // MARK: -
}
