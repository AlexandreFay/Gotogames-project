//
//  NavigationStrategy.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class NavigationStrategy: NSObject {
    
    static let sharedInstance = NavigationStrategy()
    
    var currentNavController: UINavigationController?

    //MARK: Display Page Methods
    
    func displayMain() {
        guard let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let viewController = MainViewController.instantiate(storyboardNamed: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        currentNavController = navigationController

        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func displayCardPage(completion: @escaping SuccessCompletionHandler) {
        let cardVC = CardViewController.instantiate(storyboardNamed: "CardStoryboard")
        let navigationController = UINavigationController(rootViewController: cardVC)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .overCurrentContext
        
        self.currentNavController?.present(navigationController, animated: true, completion: {
            completion(true, nil)
        })
    }
    
    //MARK: Close Page Methods
        
    func closeCardPage() {
        currentNavController?.dismiss(animated: true, completion: nil)
    }
}
