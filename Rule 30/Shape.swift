//
//  Shape.swift
//  Rule 30
//
//  Created by Luke Regan on 5/5/19.
//  Copyright © 2019 Luke Regan. All rights reserved.
//

import UIKit

class Shape: UIView {
    
    init(fillColor: UIColor, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat, frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = fillColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
