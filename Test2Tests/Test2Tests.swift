//
//  Test2Tests.swift
//  Test2Tests
//
//  Created by Einstein Nguyen on 4/14/20.
//  Copyright © 2020 Einstein Nguyen. All rights reserved.
//

import XCTest
@testable import Barkulator

class Test2Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testStoreValue() {
        let sut = ViewController()
        sut.value1 = 0.0
        sut.value2 = 0.0
        sut.computationTextView.text = "10.0"
        sut.storeValue()
        XCTAssert(sut.value1 == 10.0 && sut.value2 == 0.0)
        
        sut.computationTextView.text = "5.0"
        sut.storeValue()
        XCTAssert(sut.value1 == 10.0 && sut.value2 == 5.0)
        
        sut.computationTextView.text = "2.0"
        sut.storeValue()
        XCTAssert(sut.value1 == 2.0 && sut.value2 == 0.0)
    }
    
    func testCalculations() {
        let sut = ViewController()
        sut.value1 = 10.0
        sut.value2 = 2.0
        
        sut.functionLabel.text = "+"
        sut.calculations()
        XCTAssert(sut.total == 12.0)
        
        sut.functionLabel.text = "-"
        sut.calculations()
        XCTAssert(sut.total == 8.0)
        
        sut.functionLabel.text = "x"
        sut.calculations()
        XCTAssert(sut.total == 20.0)
        
        sut.functionLabel.text = "/"
        sut.calculations()
        XCTAssert(sut.total == 5.0)
    }
    
    func testInvertValue() {
        let sut = ViewController()
        sut.computationTextView.text = "10.0"
        
        sut.invertValue()
        XCTAssert(sut.computationTextView.text == "-10.0")
        
        sut.invertValue()
        XCTAssert(sut.computationTextView.text == "10.0")
    }

}
