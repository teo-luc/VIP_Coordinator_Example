//
//  ContactPresenter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol ContactPresentationLogic {
    var viewController: ContactDisplayLogic? { get set }
    func presentLogonUser(fullName: String)
    func presentSuggestFriends(friends: [(String, String)])
}

class ContactPresenter: ContactPresentationLogic {
    weak var viewController: ContactDisplayLogic?

    // MARK: Do something
    func presentLogonUser(fullName: String) {
        //
        // TODO: Some stuff here!
        //
        viewController?.displayingLogonUser(fullName: fullName)
    }
    
    func presentSuggestFriends(friends: [(String, String)]) {
        //
        // TODO: Some stuff here!
        //
        viewController?.displayingDisplayingSuggestFriends(suggestFriends: friends)
    }
}
