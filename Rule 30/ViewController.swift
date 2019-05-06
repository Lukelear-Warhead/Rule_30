//
//  ViewController.swift
//  Rule 30
//
//  Created by Luke Regan on 5/5/19.
//  Copyright © 2019 Luke Regan. All rights reserved.
//

import UIKit

class ShapeController: UIViewController {
    
    var primaryFillColor: UIColor {
        let color = UIColor(
            hue: 0.01,
            saturation: 0.01,
            brightness: CGFloat.random(in: 0.3...0.9),
            alpha: 1)
        return color
    }
    
    var directions = DirectionRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .skyBlue
        setUpGestures()
        layoutViews()
    }
    
    private func layoutViews() {
        let frameSize = view.bounds.width / 10
        let numberOfViews = Int(max(view.bounds.height, view.bounds.width)) / Int(frameSize) + 1
        for xIndex in 0..<numberOfViews {
            let yShape = createShape(size: frameSize, horizontalIndex: xIndex, verticleIndex: 0)
            animateShape(shape: yShape, delay: xIndex)
            for yIndex in 0..<numberOfViews {
                let xShape = createShape(size: frameSize, horizontalIndex: xIndex, verticleIndex: yIndex)
                animateShape(shape: xShape, delay: yIndex, beforeAnimation: false)
            }
        }
    }
    
    private func createShape(size: CGFloat, horizontalIndex: Int, verticleIndex: Int) -> Shape {
        let orign = CGPoint(x: horizontalIndex * Int(size), y: verticleIndex * Int(size))
        let rect = CGRect(origin: orign, size: CGSize(width: size, height: size))
        let saturation = max(CGFloat(horizontalIndex) * CGFloat(0.1), CGFloat(verticleIndex) * CGFloat(0.1))
        let hue = min(CGFloat(verticleIndex) * CGFloat(0.1), CGFloat(verticleIndex) * CGFloat(0.1))
        let fillColor = primaryFillColor.modified(
            withAdditionalHue: hue,
            additionalSaturation: saturation
        )
        let borderColor = primaryFillColor.modified(
            withAdditionalHue: saturation,
            additionalSaturation: hue
        )
        let shape = Shape(fillColor: fillColor, borderColor: borderColor, borderWidth: CGFloat.random(in: 2.0...3.0), cornerRadius: 5, frame: rect)
        shape.convert(shape.frame.origin, to: view)
        animateShape(shape: shape)
        view.addSubview(shape)
        return shape
    }
    
    private func animateShape(shape: Shape, delay: Int = 0, beforeAnimation: Bool = true) {
        if beforeAnimation {
            shape.alpha = 0
            shape.transform = CGAffineTransform(scaleX: 4, y: 4)
        } else {
            UIView.animate(withDuration: 0.5, delay: Double(delay) * 0.05, options: .curveEaseOut, animations: {
                shape.alpha = 1
                shape.transform = CGAffineTransform(scaleX: 2, y: 2)
                shape.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: { _ in
                UIView.animate(withDuration: Double.random(in: 3.9...4.0), delay: 0, options: [.repeat, .autoreverse], animations: {
                    shape.transform = CGAffineTransform(rotationAngle: 250)
                }, completion: nil)
                UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .transitionCrossDissolve, .curveEaseInOut], animations: {
                    shape.backgroundColor = shape.backgroundColor?.modified(withAdditionalHue: -0.025)
                }, completion: nil)
            })
        }
        
    }
    
    @objc func refresh() {
        view.subviews.forEach { $0.removeFromSuperview() }
        layoutViews()
    }
    
    @objc func modifyViews(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        let modifier = directions.getModifiers(point: translation)
        print(modifier.direction)
        switch modifier.direction {
        case .up, .right:
            view.subviews.forEach { (view) in
                let shape = view as! Shape
                shape.backgroundColor = shape.backgroundColor?.modified(withAdditionalHue: 0.01)
            }
        case .down, .left:
            view.subviews.forEach { (view) in
                let shape = view as! Shape
                shape.backgroundColor = shape.backgroundColor?.modified(withAdditionalHue: -0.01)
            }
        }
        
    }
    
    private func setUpGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(refresh))
        view.addGestureRecognizer(tap)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(modifyViews))
        view.addGestureRecognizer(pan)
    }
    
}



