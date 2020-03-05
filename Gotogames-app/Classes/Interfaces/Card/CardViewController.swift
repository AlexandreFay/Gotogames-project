//
//  CardViewController.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, Storyboarded {

    @IBOutlet weak var backgroundCardImageView: UIImageView!
    @IBOutlet weak var frontCardImageView: UIImageView!
    
    private enum Card {
        case Front
        case Background
        case None
    }
    
    private var currentlyDisplayedCard: Card = .Front
    
    @objc func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

        UIView.transition(from: currentlyDisplayedCard == .Front ? frontCardImageView : backgroundCardImageView, to: currentlyDisplayedCard == .Front ? backgroundCardImageView : frontCardImageView, duration: 1.0, options: transitionOptions) { (ended) in
            if ended {
                self.currentlyDisplayedCard = self.currentlyDisplayedCard == .Front ? .Background : .Front
            } else {
                self.currentlyDisplayedCard = .None
            }
        }
    }

    //MARK: Button gesture
    
    @IBAction func didSelectFlipCard(_ sender: Any) {
        if currentlyDisplayedCard != .None {
            perform(#selector(flip), with: nil, afterDelay: 0)
        }
    }
    
    @IBAction func didSelectCloseCard(_ sender: Any) {
        NavigationStrategy.sharedInstance.closeCardPage()
    }
}
