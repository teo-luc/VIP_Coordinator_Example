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
    case asset
}

class HomeTabCoordinator: TabBarCoordinator<HomeTabRoute> {
    private let contactRouter: StrongRouter<ContactRoute>
    private let assetRouter: StrongRouter<AssetRoute>
    
    convenience init(userId: Int, firstName: String, lastName: String) {
        let contactRouter = ContactCoordinator(userId : userId,
                                               firstName: firstName,
                                               lastName: lastName)
        let assetRouter   = AssetCoordinator()
        assetRouter.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag : 1)
        contactRouter.viewController.tabBarItem   = UITabBarItem(tabBarSystemItem: .recents, tag   : 0)
        self.init(contactRouter: contactRouter.strongRouter,
                  assetRouter: assetRouter.strongRouter)
    }
    
    
    
    init(contactRouter: StrongRouter<ContactRoute>, assetRouter: StrongRouter<AssetRoute>) {
        self.contactRouter = contactRouter
        self.assetRouter = assetRouter
        super.init(tabs: [contactRouter, assetRouter], select: contactRouter)
    }
    
    override func prepareTransition(for route: HomeTabRoute) -> TabBarTransition {
        switch route {
        case .contact:
            return .select(contactRouter)
        case .asset:
            return .select(assetRouter)
        }
    }

}
