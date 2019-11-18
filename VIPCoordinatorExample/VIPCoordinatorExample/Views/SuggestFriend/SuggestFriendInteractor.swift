//
//  SuggestFriendInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol SuggestFriendBusinessLogic {
    var presenter: SuggestFriendPresentationLogic? { get set }
    func directDisplayingSuggestFriend()
}

protocol SuggestFriendDataStore {
    var firstName: String? {set get}
    var lastName: String? {set get}
}

class SuggestFriendInteractor: SuggestFriendBusinessLogic, SuggestFriendDataStore {
    //
    var firstName: String?
    var lastName: String?
    //
    var presenter: SuggestFriendPresentationLogic?
    var worker: SuggestFriendWorker?
    func directDisplayingSuggestFriend() {
        self.presenter?.presentDisplayingSuggestFriend(firstName: firstName ?? "#unknownFirstName", lastName: lastName ?? "#unknownLastName")
    }
}
