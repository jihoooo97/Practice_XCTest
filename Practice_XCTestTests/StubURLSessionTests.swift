//
//  StubURLSessionTests.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/15/24.
//

import XCTest
@testable import Practice_XCTest

final class StubURLSessionTests: XCTestCase {

    var sut: UpDownGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UpDownGame()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_randomValue_get3() {
        // given
        let promise = expectation(description: "get 3")
        
        guard let url = URL(string: "http://www.randomnumberapi.com/api/v1.0/random?min=1&max=30&count=1") else { return }
        
        let data = "[3]".data(using: .utf8)
        let response = HTTPURLResponse(
            url: url,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        let dummy = DummyData(data: data, response: response, error: nil) // 1
        let stubURLSession = StubURLSession(dummy: dummy) // 2
        
        sut.urlSession = stubURLSession // 3
        
        // when
        sut.reset {
            // then
            XCTAssertEqual(self.sut.randomValue, 3)
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 10)
    }

}
