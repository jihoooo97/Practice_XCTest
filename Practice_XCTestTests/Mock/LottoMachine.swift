//
//  LottoMachine.swift
//  Practice_XCTestTests
//
//  Created by 유지호 on 8/12/24.
//

import Foundation

class LottoMachine {
    
    func makeRandomNumbers() -> [Int] {
        var numbers: Set<Int> = []
        
        while numbers.count < 6 {
            let randomNumber = Int.random(in: 1...45)
            numbers.insert(randomNumber)
        }
        
        return Array(numbers)
    }
    
    func isValidLottoNumbers(of numbers: [Int]) -> Bool {
        guard numbers.count == 6, Set(numbers).count == 6 else { return false }
        
        for number in numbers {
            guard 1...45 ~= number else {
                return false
            }
        }
        
        return true
    }
    
    func countMatchingNumber(user: [Int], winner: [Int]) throws -> Int {
        guard isValidLottoNumbers(of: user) && isValidLottoNumbers(of: winner) else {
            throw NSError(domain: "invalid numbers", code: 402)
        }
        
        let winNumbers = user.filter { winner.contains($0) }
        return winNumbers.count
    }
    
}
