//
//  PageInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol PageBusinessLogic {
    var presenter: PagePresentationLogic? { get set }
}

protocol PageDataStore {
}

class PageInteractor: PageBusinessLogic, PageDataStore {
    var presenter: PagePresentationLogic?
    var worker: PageWorker?

}
