//
//  CustomDismissPopoverSegue.swift
//  PopOver
//
//  Created by Christopher Casey on 1/1/19.
//  Copyright © 2019 Christopher Casey. All rights reserved.
//

import UIKit

class CustomDismissPopoverSegue: NSObject {

}

extension CustomDismissPopoverSegue: UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let sourceController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let destinationController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let theContainingView = transitionContext.containerView
        
        
        theContainingView.insertSubview(destinationController!.view, belowSubview: sourceController!.view)
    
        let theDismissingFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height), size: UIScreen.main.bounds.size )
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            sourceController!.view.frame = theDismissingFrame
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
        
    }
    
    
}
