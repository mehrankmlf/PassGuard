//
//  DeductionsRules.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/25/23.
//

import Foundation

internal struct DeductionsRules {
    
    let rules: [EnvironmentRules]
    
    init(rules: [EnvironmentRules] = [LetterOnly(),
                                      NumberOnly(),
                                      RepeatCharacters(),
                                      ConsecutiveNumbers(),
                                      ConsecutiveUppercase(),
                                      ConsecutiveLowercase(),
                                      ConsecutiveNumbers(),
                                      SequentialLetter(),
                                      SequentialNumber(),
                                      SequentialSymbol()]) {
        self.rules = rules
    }
}

extension DeductionsRules: Calculatable {
    /// Calculated all of the rules that need to deduction.
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    func scoreCalculatore(_ password: String) -> Int {
        var totalScore: Int = 0
        
        for rule in rules {
            totalScore += rule.score(password)
        }
        return totalScore
    }
}
