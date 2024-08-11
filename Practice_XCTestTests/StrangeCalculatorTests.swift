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

}
