//
//  AssetViewController.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol FavoritesDisplayLogic: class {
}

class FavoritesViewController: UIViewController, FavoritesDisplayLogic {
    var interactor: FavoritesBusinessLogic?
    var router: (NSObjectProtocol & FavoritesRoutingLogic & AssetDataPassing)?

    // MARK: Object lifecycle
    deinit {
        print("DEINIT - AssetViewController")
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnDidLoad()
        runTaskOnDidLoad()
    }

    // MARK: Setup
    func setupOnDidLoad() {
    }

    // MARK: Do something
    func runTaskOnDidLoad() {
    }
}
