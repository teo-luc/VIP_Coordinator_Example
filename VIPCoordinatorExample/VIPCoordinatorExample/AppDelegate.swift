//
//  AppDelegate.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright © 2019 TEQ. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var share: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    let container = Container()
    lazy var mainCoordinator:AppCoordinator  = {
        return AppCoordinator()
    }()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        mainCoordinator.setRoot(for: window!)
        return true
    }
}



