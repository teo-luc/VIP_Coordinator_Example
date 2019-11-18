//
//  RouterCoordinatorType.swift
//  Shiodome
//
//  Created by Teqnological on 11/15/19.
//  Copyright © 2019 Asia Teqnological. All rights reserved.
//

import Foundation
import XCoordinator

protocol RouterCoordinatorLogic: NSObjectProtocol {
    associatedtype T: Route
    var coordinator: UnownedRouter<T>? { get set }
}
