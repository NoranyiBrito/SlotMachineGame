//
//  UIButton.swift
//  slotMachine
//
//  Created by Noranyi Brito on 10/24/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func pulsate() {
    
    
        let press = CASpringAnimation(keyPath: "transform.scale")
        press.duration = 0.6
        press.fromValue = 0.95
        press.toValue = 1.0
        press.autoreverses = true
        press.repeatCount = 2
        press.initialVelocity = 0.5
        press.damping = 1.0
        
        layer.add(press, forKey: nil)
    }
    
    
}
