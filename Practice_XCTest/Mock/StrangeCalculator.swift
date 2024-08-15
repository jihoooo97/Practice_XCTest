//
//  StrangeCalculator.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/12/24.
//

import Foundation

class StrangeCalculator {
    
    func addNumbers(of numbers: [Int]) -> Int {
        return numbers.reduce(0, +)
    }
    
    func addOddNumbers(of numbers: [UInt]) -> UInt {
        return numbers.filter { $0 % 2 == 1 }.reduce(0, +)
    }
    
}
