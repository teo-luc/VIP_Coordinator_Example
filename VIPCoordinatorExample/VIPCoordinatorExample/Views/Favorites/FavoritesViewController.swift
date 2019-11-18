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
    
    var pageViewController: UIPageViewController?
    
    private(set) lazy var orderedViewControllers: [PageViewController] = {
        return []
    }()


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
        pageViewController = UIPageViewController.init(transitionStyle: .pageCurl,
                                                       navigationOrientation: .horizontal,
                                                       options: nil)
        setupPageVC(pageController: pageViewController!)
    }

    // MARK: Do something
    func runTaskOnDidLoad() {
    }
    
    // MARK: -
    
    func setupPageVC(pageController: UIPageViewController) {
        pageController.isDoubleSided = true
        pageController.dataSource = self
        pageController.delegate = self

        pageController.setViewControllers(orderedViewControllers,
                                          direction: UIPageViewController.NavigationDirection.forward,
                                          animated: true,
                                          completion: nil)

        pageViewController = pageController
        self.addChild(pageViewController!)
        self.view.insertSubview(pageViewController!.view, at: 0)
        pageViewController!.didMove(toParent: self)

    }
}


extension FavoritesViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.orderedViewControllers.firstIndex(of:viewController as! PageViewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return nil
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of:viewController as! PageViewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count

            guard orderedViewControllersCount != nextIndex else {
                return nil
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
}
