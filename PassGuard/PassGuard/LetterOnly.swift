//
//  LetterOnly.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/25/23.
//

import Foundation

internal struct LetterOnly: EnvironmentRules {
    /// Check password contains only letter then count it and subtracts it by password.count
    ///
    /// ```
    /// print(LetterOnly.score("Helloworld")) // "-10"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > -n
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
     func score(_ password: String) -> Int {
        var score: Int = 0
        
        if self.onlyLettersChecker(password) {
            let count = password.count
            score += count
        }
        return score
    }
    
    private func onlyLettersChecker(_ password: String) -> Bool {
        return password.range(of: RegexPattern.onlyLetters, options: .regularExpression) == nil
    }
}
