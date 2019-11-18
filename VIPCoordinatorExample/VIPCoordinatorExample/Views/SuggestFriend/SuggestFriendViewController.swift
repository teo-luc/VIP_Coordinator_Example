//
//  SuggestFriendViewController.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol SuggestFriendDisplayLogic: class {
    func displaySuggestFriend(firstName: String, lastName: String)
}

class SuggestFriendViewController: UIViewController, SuggestFriendDisplayLogic {
    var interactor: SuggestFriendBusinessLogic?
    var router: (NSObjectProtocol & SuggestFriendRoutingLogic & SuggestFriendDataPassing)?
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!

    // MARK: Object lifecycle
    deinit {
        print("DEINIT - SuggestFriendViewController")
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnDidLoad()
        runTaskOnDidLoad()
        directDisplayingSuggestFriend()
    }

    // MARK: Setup
    func setupOnDidLoad() {
    }

    // MARK: Do something
    func runTaskOnDidLoad() {
    }
    
    // MARK: - Display Suggest Friend
    func directDisplayingSuggestFriend() {
        interactor?.directDisplayingSuggestFriend()
    }
    func displaySuggestFriend(firstName: String, lastName: String) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
    }
}
