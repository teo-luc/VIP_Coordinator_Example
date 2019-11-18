//
//  SuggestFriendPresenter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol SuggestFriendPresentationLogic {
    var viewController: SuggestFriendDisplayLogic? { get set }
    func presentDisplayingSuggestFriend(firstName: String, lastName: String)
}

class SuggestFriendPresenter: SuggestFriendPresentationLogic {
    weak var viewController: SuggestFriendDisplayLogic?

    // MARK: Do something
    func presentDisplayingSuggestFriend(firstName: String, lastName: String) {
        viewController?.displaySuggestFriend(firstName: firstName, lastName: lastName)
    }
}
