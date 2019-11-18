//
//  AssetInteractor.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol FavoritesBusinessLogic {
    var presenter: FavoritesPresentationLogic? { get set }
}

protocol FavoritesDataStore {
}

class FavoritesInteractor: FavoritesBusinessLogic, FavoritesDataStore {
    var presenter: FavoritesPresentationLogic?
    var worker: FavoritesWorker?

}
