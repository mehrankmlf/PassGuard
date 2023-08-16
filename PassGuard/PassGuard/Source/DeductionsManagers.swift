//
//  DeductionsRules.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/25/23.
//

import Foundation

/// DeductionsRules` defines a set of rules to calculate deduction scores for a password based on various environment-related criteria.
internal struct DeductionsRules {
    /// The collection of environment rules to be applied when calculating deduction scores.
    let rules: [EnvironmentRules]
    
    /// Initializes a new instance of `DeductionsRules` with optional custom environment rules.
    ///
    /// - Parameter rules: The environment rules to be used for deduction scoring. Defaults to a set of commonly used rules.
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
