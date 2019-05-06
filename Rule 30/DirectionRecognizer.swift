//
//  DirectionRecognizer.swift
//  Rule 30
//
//  Created by Luke Regan on 5/6/19.
//  Copyright © 2019 Luke Regan. All rights reserved.
//

import UIKit

struct DirectionRecognizer {
    
    var previousPoint = CGPoint(x: 0, y: 0)
    
    mutating func getModifiers(point: CGPoint) -> (direction: Direction, difference: CGPoint) {
        if previousPoint == CGPoint(x: 0, y: 0) {
            previousPoint = point
            return (.none, CGPoint(x: 0, y: 0))
        }
        let difference = CGPoint(x: abs(point.x - previousPoint.x), y: abs(point.y - previousPoint.y))
        let direction = getDirections(point: point)
        previousPoint = point
        return (direction, difference)
    }
    
    private func getDirections(point: CGPoint) -> Direction {
        var direction: Direction = .up
        var difference: CGFloat = 0
        let xDistance = abs(point.x - previousPoint.x)
        let yDistance = abs(point.y - previousPoint.y)
        if point.y < previousPoint.y && difference < yDistance {
            difference = yDistance
            direction = .up
        }
        if point.x > previousPoint.x && difference < xDistance {
            difference = xDistance
            direction = .right
        }
        if point.y > previousPoint.y && difference < yDistance {
            difference = yDistance
            direction = .down
        }
        if point.x < previousPoint.x && difference < xDistance {
            difference = xDistance
            direction = .left
        }
        return direction
    }
    
    enum Direction {
        case up
        case left
        case right
        case down
        case none
    }
    
}
