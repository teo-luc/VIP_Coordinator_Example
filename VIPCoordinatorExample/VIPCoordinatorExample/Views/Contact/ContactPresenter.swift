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
}

class ContactPresenter: ContactPresentationLogic {
    weak var viewController: ContactDisplayLogic?

    // MARK: Do something
}
