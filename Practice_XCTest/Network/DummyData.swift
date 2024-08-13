//
//  DummyData.swift
//  Practice_XCTest
//
//  Created by 유지호 on 8/13/24.
//

import Foundation

struct DummyData {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    var completionHandler: DataTaskCompletionHandler? = nil
    
    func completion() {
        completionHandler?(data, response, error)
    }
}
