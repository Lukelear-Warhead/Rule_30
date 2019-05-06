//
//  UIColor+Helper.swift
//  Rule 30
//
//  Created by Luke Regan on 5/5/19.
//  Copyright © 2019 Luke Regan. All rights reserved.
//

import UIKit

extension UIColor {
    
    func modified(withAdditionalHue hue: CGFloat = 0, additionalSaturation: CGFloat = 0, additionalBrightness: CGFloat = 0) -> UIColor {
        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if self.getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha) {
            
            return UIColor(hue: currentHue + hue,
                           saturation: currentSaturation + additionalSaturation,
                           brightness: currentBrigthness + additionalBrightness,
                           alpha: currentAlpha)
        } else {
            return self
        }
    }
    
    class var skyBlue: UIColor {
        get {
            return UIColor(hue: 210/359, saturation: 20/100, brightness: 92/100, alpha: 1)
        }
    }
}
