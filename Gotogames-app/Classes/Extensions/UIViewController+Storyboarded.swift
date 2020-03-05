//
//  UIViewController+Storyboarded.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardNamed: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(storyboardNamed: String) -> Self {
        let viewControllerId = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardNamed, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: viewControllerId) as! Self
    }
}
