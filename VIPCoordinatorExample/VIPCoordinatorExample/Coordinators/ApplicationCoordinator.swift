//
//  AssetCoordinator.swift
//  Shiodome
//
//  Created by Teqnological on 11/14/19.
//  Copyright © 2019 Asia Teqnological. All rights reserved.
//

import Foundation
import XCoordinator

enum ApplicationRoute: Route {
    typealias RawValue = ApplicationRoute
    case login
    case homeTab(StrongRouter<HomeTabRoute>)
}

class AppCoordinator: NavigationCoordinator<ApplicationRoute> {
    init() {
        super.init(initialRoute: .login)
    }
    
    override func prepareTransition(for route: ApplicationRoute) -> NavigationTransition {
        let container = AppDelegate.share.container
        switch route {
        case .login:
            let vc = LoginAssembly().resolve(container: container, LoginViewController.self)
            vc.router?.coordinator = unownedRouter
            return .push(vc)
        case .homeTab(let homeTab):
            homeTab.viewController?.modalPresentationStyle = .fullScreen
            return .present(homeTab)
        }
    }

    deinit {
        print("AssetCoordinator deinit")
    }
}
