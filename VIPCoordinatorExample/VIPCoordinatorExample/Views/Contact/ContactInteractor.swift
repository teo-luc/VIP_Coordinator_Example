//
//  ContactInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol ContactBusinessLogic {
    var presenter: ContactPresentationLogic? { get set }
    func directDisplayingLogonUser()
    func directDisplayingSuggestFriends()
}

protocol ContactDataStore {
    var userId    : Int?    { get set }
    var firstName : String? { get set }
    var lastName  : String? { get set }
}

class ContactInteractor: ContactBusinessLogic, ContactDataStore {
    //
    var userId: Int?
    var firstName: String?
    var lastName: String?
    //
    var presenter: ContactPresentationLogic?
    var worker: ContactWorker?

    
    //
    func directDisplayingLogonUser() {
        var fullName: String
        if let firstName = firstName, let lastName = lastName {
            fullName = firstName + " " + lastName
        } else {
            fullName = "<#UnknownUser>"
        }
        presenter?.presentLogonUser(fullName: fullName)
    }
    
    func directDisplayingSuggestFriends() {
        let friends = suggestFriendsProvider
        presenter?.presentSuggestFriends(friends: friends)
    }
}
