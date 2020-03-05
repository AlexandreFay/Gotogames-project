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
    }
    
    private var currentlyDisplayedCard: Card = .Front
    private var animationInProgress: Bool = false
    private var currentRotationDegree: CGFloat = 0
    
    func degToRad(_ number: CGFloat) -> CGFloat {
        return number * .pi / 180.0
    }
    
    @objc func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

        UIView.transition(from: currentlyDisplayedCard == .Front ? frontCardImageView : backgroundCardImageView, to: currentlyDisplayedCard == .Front ? backgroundCardImageView : frontCardImageView, duration: 1.0, options: transitionOptions) { (ended) in
            if ended {
                self.currentlyDisplayedCard = self.currentlyDisplayedCard == .Front ? .Background : .Front
                self.animationInProgress = false
            } else {
                self.animationInProgress = true
            }
        }
    }
    
    @objc func rotate() {
        UIView.animate(withDuration: 1.0, animations: {
            self.animationInProgress = true
            self.currentRotationDegree = self.currentRotationDegree == 0 ? 180 : 0
            self.frontCardImageView.transform = CGAffineTransform(rotationAngle: self.degToRad(self.currentRotationDegree))
            self.backgroundCardImageView.transform = CGAffineTransform(rotationAngle: self.degToRad(self.currentRotationDegree))
        }, completion: { (ended) in
            self.animationInProgress = ended ? false : true
        })
    }
    
    @objc func wizz() {
        UIView.animateKeyframes(withDuration: 0.1, delay: 0, options: [.autoreverse], animations: {
            UIView.setAnimationRepeatCount(2)
            self.animationInProgress = true
            self.frontCardImageView.transform = CGAffineTransform(translationX: -10, y: 0)
            self.backgroundCardImageView.transform = CGAffineTransform(translationX: 10, y: 0)
        }, completion: { (ended) in
            UIView.animate(withDuration: 0.1, animations: {
                self.frontCardImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.backgroundCardImageView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { (ended) in
                self.animationInProgress = ended ? false : true
            })
        })
    }

    //MARK: Button gesture
    
    @IBAction func didSelectWizzCard(_ sender: Any) {
        if animationInProgress == false {
            perform(#selector(wizz))
        }
    }
    
    @IBAction func didSelectRotateCard(_ sender: Any) {
        if animationInProgress == false {
            perform(#selector(rotate))
        }
    }
    
    @IBAction func didSelectFlipCard(_ sender: Any) {
        if animationInProgress == false {
            perform(#selector(flip), with: nil, afterDelay: 0)
        }
    }
    
    @IBAction func didSelectCloseCard(_ sender: Any) {
        NavigationStrategy.sharedInstance.closeCardPage()
    }
}
