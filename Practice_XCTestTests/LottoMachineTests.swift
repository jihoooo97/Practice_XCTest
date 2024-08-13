//
//  LottoMachineTests.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/12/24.
//

import XCTest
@testable import Practice_XCTest

final class LottoMachineTests: XCTestCase {

    var sut: LottoMachine!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LottoMachine()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_isValidLottoNumbers_withLessNumbers_returnFalse() {
        // given
        let input = [3, 6, 9]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_withMoreNumbers_returnFalse() {
        // given
        let input = [3, 6, 9, 12, 15, 18, 21, 24]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_withMoreDuplicatedNumbers_returnFalse() {
        // given
        let input = [3, 6, 9, 12, 15, 18, 15, 9]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }

    func test_isValidLottoNumbers_withNotDuplicatedNumbers_returnTrue() {
        // given
        let input = [3, 6, 9, 12, 15, 18]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidLottoNumbers_withDuplicatedNumbers_returnFalse() {
        // given
        let input = [3, 6, 9, 9, 15, 18]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_withSmallThen1_returnFalse() {
        // given
        let input = [0, 6, 9, 12, 15, 18]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers_withLargeThen45_returnFalse() {
        // given
        let input = [3, 6, 9, 12, 15, 50]
        
        // when
        let result = sut.isValidLottoNumbers(of: input)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_makeRandomNumber_isValidArray() {
        // given
        let randomNumbers = sut.makeRandomNumbers()
        
        // when
        let result = sut.isValidLottoNumbers(of: randomNumbers)
        
        // then
        XCTAssertTrue(result)
    }
    
}
