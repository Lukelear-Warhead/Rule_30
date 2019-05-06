//
//  Rule_30Tests.swift
//  Rule 30Tests
//
//  Created by Luke Regan on 5/5/19.
//  Copyright © 2019 Luke Regan. All rights reserved.
//

import XCTest
@testable import Rule_30

class Rule_30Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDirectionModifier() {
        let point = CGPoint(x: 20, y: 50)
        
        var recognizer = DirectionRecognizer()
        _ = recognizer.getModifiers(point: point)
        let direction = recognizer.getModifiers(point: CGPoint(x: 22, y: 20)).direction
        
        XCTAssertTrue(direction == .up)
    }
    
    func testDifferenceModifier() {
        let point = CGPoint(x: 20, y: 50)
        
        var recognizer = DirectionRecognizer()
        _ = recognizer.getModifiers(point: point)
        let difference = recognizer.getModifiers(point: CGPoint(x: 22, y: 20)).difference
        let absolutePoint = CGPoint(x: 2, y: 30)
        
        XCTAssertTrue(difference == absolutePoint)
    }
    
    func testColorModifier() {
        let startColor = UIColor(hue: 0.9, saturation: 0.5, brightness: 0.5, alpha: 1)
        let modifiedColor = startColor.modified(withAdditionalHue: 0.2)
        
        var startHue: CGFloat = 0.0
        startColor.getHue(&startHue, saturation: nil, brightness: nil, alpha: nil)
        
        var modifiedHue: CGFloat = 0.0
        modifiedColor.getHue(&modifiedHue, saturation: nil, brightness: nil, alpha: nil)
        
        XCTAssertTrue(startHue != modifiedHue)
    }

}
