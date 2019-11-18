//
//  PagePresenter.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol PagePresentationLogic {
    var viewController: PageDisplayLogic? { get set }
}

class PagePresenter: PagePresentationLogic {
    weak var viewController: PageDisplayLogic?

    // MARK: Do something
}
