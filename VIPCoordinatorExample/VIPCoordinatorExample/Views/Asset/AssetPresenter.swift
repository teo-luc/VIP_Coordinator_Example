//
//  AssetPresenter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol AssetPresentationLogic {
    var viewController: AssetDisplayLogic? { get set }
}

class AssetPresenter: AssetPresentationLogic {
    weak var viewController: AssetDisplayLogic?

    // MARK: Do something
}
