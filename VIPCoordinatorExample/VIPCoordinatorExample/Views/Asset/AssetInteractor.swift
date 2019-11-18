//
//  AssetInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol AssetBusinessLogic {
    var presenter: AssetPresentationLogic? { get set }
}

protocol AssetDataStore {
}

class AssetInteractor: AssetBusinessLogic, AssetDataStore {
    var presenter: AssetPresentationLogic?
    var worker: AssetWorker?

}
