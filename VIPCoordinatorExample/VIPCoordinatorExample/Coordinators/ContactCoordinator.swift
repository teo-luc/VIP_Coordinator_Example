//
//  HomeCoordinator.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright © 2019 TEQ. All rights reserved.
//

import Foundation
import XCoordinator

enum ContactRoute: Route {
    case contact
    case suggestFriend(lastName: String, firstName: String)
}

class ContactCoordinator: NavigationCoordinator<ContactRoute> {
    let userId    : Int
    let firstName : String
    let lastName  : String
    init(userId: Int, firstName: String, lastName: String) {
        self.userId    = userId
        self.firstName = firstName
        self.lastName  = lastName
        super.init(initialRoute: .contact)
    }
    
    override func prepareTransition(for route: ContactRoute) -> NavigationTransition {
        let container = AppDelegate.share.container
        switch route {
        case .contact:
            let vc = ContactAssembly().resolve(container: container, ContactViewController.self)
            // Adding
            vc.router?.coordinator = unownedRouter
            // Passing data
            var dataStore        = vc.router?.dataStore
            dataStore?.userId    = userId
            dataStore?.firstName = firstName
            dataStore?.lastName  = lastName
            //
            return .push(vc)
        case .suggestFriend(let firstName, let lastName):
            //
            let vc = SuggestFriendAssembly().resolve(container: container, SuggestFriendViewController.self)
            //
            vc.router?.coordinator = unownedRouter
            //
            var dataStore        = vc.router?.dataStore
            dataStore?.firstName = firstName
            dataStore?.lastName  = lastName
            return .push(vc)
        }
    }
}
