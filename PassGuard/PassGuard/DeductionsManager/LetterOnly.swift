//
//  LetterOnly.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/25/23.
//

import Foundation

struct LetterOnly: EnvironmentRules {
    static func score(_ password: String) -> Int {
        var score: Int = 0
        
        if self.onlyLettersChecker(password) {
            let count = password.count
            score += count
        }
        return score
    }
    
    private static func onlyLettersChecker(_ password: String) -> Bool {
        return password.range(of: RegexType.onlyLetters, options: .regularExpression) == nil
    }
}
