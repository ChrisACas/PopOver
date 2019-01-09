//
//  PopOverViewController.swift
//  PopOver
//
//  Created by Christopher Casey on 12/23/18.
//  Copyright © 2018 Christopher Casey. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {
    
    @IBOutlet weak var popOver: UIView!
    
    override func viewDidLoad() {
        popOver.layer.cornerRadius = 25
        
    }

    var interactor:Interactor? = nil
    

    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            print("\nDid Begin")
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
            break
        case .changed:
            print("\nDid changed")
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
            break
        case .cancelled:
            print("\nDid cancelled")
            interactor.hasStarted = false
            interactor.cancel()
            break
        case .ended:
            print("\nDid ended")
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
            
            break
        default:
            break
        
        }
    }
    
    
    
}
