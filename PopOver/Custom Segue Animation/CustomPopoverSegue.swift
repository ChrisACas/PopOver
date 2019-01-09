//
//  CustomPopoverSegue.swift
//  PopOver
//
//  Created by Christopher Casey on 1/1/19.
//  Copyright © 2019 Christopher Casey. All rights reserved.
//

import UIKit

class CustomPopoverSegue: UIStoryboardSegue {
    
    override func perform() {
        let destinationController = self.destination
        let sourceController = self.source
        
        let theContainingView = sourceController.view.superview
        let sourceCenter = sourceController.view.center
        
        destinationController.view.transform = CGAffineTransform(translationX: 0.0, y: destinationController.view.frame.height)
        destinationController.view.center = sourceCenter
        
        theContainingView?.addSubview(destinationController.view)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options:[.preferredFramesPerSecond60, .curveEaseInOut],
                       animations: {destinationController.view.transform = CGAffineTransform.identity},
                       completion: nil)
        
    }

}
