//
//  PageViewController.swift
//  VIPCoordinatorExample
//
//  Created by Teqnological on 11/18/19.
//  Copyright (c) 2019 TEQ. All rights reserved.
//

import UIKit

protocol PageDisplayLogic: class {
}

class PageViewController: UIViewController, PageDisplayLogic {
    var interactor: PageBusinessLogic?
    var router: (NSObjectProtocol & PageRoutingLogic & PageDataPassing)?

    // MARK: Object lifecycle
    deinit {
        print("DEINIT - PageViewController")
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
