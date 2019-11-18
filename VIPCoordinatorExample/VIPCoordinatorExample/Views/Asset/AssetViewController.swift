//
//  AssetViewController.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/15/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol AssetDisplayLogic: class {
}

class AssetViewController: UIViewController, AssetDisplayLogic {
    var interactor: AssetBusinessLogic?
    var router: (NSObjectProtocol & AssetRoutingLogic & AssetDataPassing)?

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
