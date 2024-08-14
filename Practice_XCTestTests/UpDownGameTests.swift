//
//  UpDownGameTests.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/13/24.
//

import XCTest
@testable import Practice_XCTest

final class UpDownGameTests: XCTestCase {

    var sut: UpDownGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UpDownGame()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_compareValue_hitNumber_largerThenRandomValue_returnDown() {
        // given
        let hitNumber = 10
        sut.randomValue = 5
        
        // when
        let result = sut.compareValue(with: hitNumber)
        
        // then
        XCTAssertEqual(result, .Down)
    }
    
    func test_compareValue_hitNumber_smallerThenRandomValue_returnUp() {
        // given
        let hitNumber = 5
        sut.randomValue = 10
        
        // when
        let result = sut.compareValue(with: hitNumber)
        
        // then
        XCTAssertEqual(result, .Up)
    }
    
    func test_compareValue_hitNumber_equalRandomValue_returnWin() {
        // given
        let hitNumber = 10
        sut.randomValue = 10

        // when
        let result = sut.compareValue(with: hitNumber)

        XCTAssertEqual(result, .Win)
    }

    func test_compareValue_tryCountIs5_hitNumber_differentRandomValue_returnLose() {
        // given
        let hitNumber = 7
        sut.randomValue = 10
        sut.tryCount = 5

        // when
        let result = sut.compareValue(with: hitNumber)

        // then
        XCTAssertEqual(result, .Lose)
    }
    
    func test_makeRandomValue_randomValue_set0to30() {
        // given
        sut.randomValue = 50 // 기본값이 0~30에 포함되면 무조건 테스트에 통과하므로 범위에서 벗어난 값을 할당

        // when
        sut.makeRandomValue {
            // then
            XCTAssertGreaterThanOrEqual(self.sut.randomValue, 0)
            XCTAssertLessThanOrEqual(self.sut.randomValue, 30)
        }
    }
    
    func test_makeRandomValue_randomValue_complete() {
        // given
        let promise = expectation(description: "It makes random value")
        sut.randomValue = 50

        // when
        sut.makeRandomValue {
            // then
            XCTAssertGreaterThanOrEqual(self.sut.randomValue, 0)
            XCTAssertLessThanOrEqual(self.sut.randomValue, 30)
            promise.fulfill()
        }

        wait(for: [promise], timeout: 10)
    }
    
    func test_reset_tryCountIs0() {
        // given
        let promise = expectation(description: "try count is 0")
        sut.tryCount = 10
        
        // when
        sut.reset {
            XCTAssertEqual(self.sut.tryCount, 0)
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 10)
    }

}
