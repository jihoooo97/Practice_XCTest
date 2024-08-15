//
//  StrangeCalculatorTests.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/11/24.
//

import XCTest
@testable import Practice_XCTest

final class StrangeCalculatorTests: XCTestCase {

    var sut: StrangeCalculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_addNumber() {
        // given
        let input = [3, 7, 23]
        
        // when
        let result = sut.addNumbers(of: input)
        
        // then
        XCTAssertEqual(result, 33)
    }
    
    // Green
    func test_emptyArray_return0() {
        // given
        let numbers: [UInt] = []
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    // Red1
    // Refactor1
    func test_input3_return3() {
        // given
        let numbers: [UInt] = [3]
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    // Red2
    // Refactor2
    func test_input4_9_return9() {
        // given
        let numbers: [UInt] = [4, 9]
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 9)
    }

    // Red3
    // Refactor3
    func test_input3_17_return20() {
        // given
        let numbers: [UInt] = [3, 17]
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 20)
    }
    
    // Red4
    // Refactor4
    func test_input4_68_222_return0() {
        // given
        let numbers: [UInt] = [4, 68, 22]
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    // Green
    func test_input4_19_22_253_1000_return272() {
        // given
        let numbers: [UInt] = [4, 19, 22, 253, 1000]
        
        // when
        let result = sut.addOddNumbers(of: numbers)
        
        // then
        XCTAssertEqual(result, 272)
    }
    
}
