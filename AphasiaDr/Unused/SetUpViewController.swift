//
//  SetUpViewController.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 11/29/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class SetUpViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var orderedViewController: [UIViewController] = {
        return [self.newVc(viewController :"page1"),
                self.newVc(viewController :"page2")
               ]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.dataSource = self
        self.delegate = self
        
      if let firstViewController = orderedViewController.first {
            setViewControllers([firstViewController],
                                direction: .forward,
                                animated: true,
                                completion: nil)
        }
        else{
            print("Hello")
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return orderedViewController.last
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewController.count != nextIndex else {
            return orderedViewController.first
        }
        
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }

    func newVc(viewController : String) -> UIViewController {
        return UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }

}
