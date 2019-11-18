//
//  Router.swift
//  MovieList
//
//  Created by Teqnological on 10/17/19.
//  Copyright © 2019 Teqnological. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import XCoordinator
// MARK: --

extension Assembly {
    func resolve<T: UIViewController>(container: Swinject.Container, _ serviceType: T.Type = T.self) -> T {
        let _ = self.assemble(container: container)
        return container.resolve(serviceType)!
    }
}

// MARK: --

protocol Reusable {
    static var reuseID: String {get}
}
extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

// MARK: --

extension UIViewController: Reusable {}
protocol Nib {}
extension Nib {
    static func loadFromNib<T: UIViewController>() -> T {
        return T.init(nibName: T.reuseID, bundle: nil)
    }
}
extension UIViewController: Nib {}
