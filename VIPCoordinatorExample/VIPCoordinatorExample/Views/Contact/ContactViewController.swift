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
    func displayingDisplayingSuggestFriends(suggestFriends: [(String, String)])
}

class ContactViewController: UIViewController, ContactDisplayLogic {
    var interactor: ContactBusinessLogic?
    var router: (NSObjectProtocol & ContactRoutingLogic & ContactDataPassing)?
    var friends = [SuggestFriendType]()
    //
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
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
        directDisplayingSuggestFriends()
    }

    // MARK: Setup
    func setupOnDidLoad() {
        tableView.register(FriendViewCell.self, forCellReuseIdentifier: FriendViewCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: Do something
    func runTaskOnDidLoad() {}
    
    
    // MARK: - Displaying Login User Logic
    func directDisplayingLogonUser() {
        self.interactor?.directDisplayingLogonUser()
    }
    
    func displayingLogonUser(fullName: String) {
        textLabel.text = "Hello \(fullName)!"
    }
    // MARK: - Displaying Suggest Friends
    func directDisplayingSuggestFriends() {
        //
        self.interactor?.directDisplayingSuggestFriends()
    }
    
    func displayingDisplayingSuggestFriends(suggestFriends: [(String, String)]) {
        friends = suggestFriends
        self.tableView.reloadData()
    }
    
    // MARK: -
}

// MARK: - Extension

extension ContactViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendViewCell.reuseID, for: indexPath) as! FriendViewCell
        let value = friends[indexPath.row]
        cell.displayFriendFullName(firstName: value.firstName, lastName: value.lastName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //
        let suggestFriend = friends[indexPath.row]
        let firstName = suggestFriend.firstName
        let lastName = suggestFriend.lastName
        //
        self.router?.displaySuggestFriend(firstName: firstName, lastName: lastName)
    }
}
