//
//  HomeTabCoordinator.swift
//  XCoordinator-Example
//
//  Created by Joan Disho on 04.05.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import Foundation
import XCoordinator

enum HomeTabRoute : Route {
    case contact
    case favorites
}

class HomeTabCoordinator: TabBarCoordinator<HomeTabRoute> {
    private let contactRouter: StrongRouter<ContactRoute>
    private let favoritesRouter: StrongRouter<FavoritesRoute>
    
    convenience init(userId: Int, firstName: String, lastName: String) {
        let contactRouter = ContactCoordinator(userId : userId,
                                               firstName: firstName,
                                               lastName: lastName)
        let assetRouter   = FavoritesCoordinator()
        assetRouter.rootViewController.tabBarItem   = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        contactRouter.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.init(contactRouter: contactRouter.strongRouter,
                  assetRouter: assetRouter.strongRouter)
    }
    
    
    
    init(contactRouter: StrongRouter<ContactRoute>, assetRouter: StrongRouter<FavoritesRoute>) {
        self.contactRouter = contactRouter
        self.favoritesRouter = assetRouter
        super.init(tabs: [contactRouter, assetRouter], select: contactRouter)
    }
    
    override func prepareTransition(for route: HomeTabRoute) -> TabBarTransition {
        switch route {
        case .contact:
            return .select(contactRouter)
        case .favorites:
            return .select(favoritesRouter)
        }
    }

}
