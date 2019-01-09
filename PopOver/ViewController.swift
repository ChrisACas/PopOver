//
//  ViewController.swift
//  PopOver
//
//  Created by Christopher Casey on 12/23/18.
//  Copyright © 2018 Christopher Casey. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let interactor = Interactor()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? PopOverViewController {
            destinationViewController.transitioningDelegate = self
                destinationViewController.interactor = interactor
        }
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissPopoverSegue()
        
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
