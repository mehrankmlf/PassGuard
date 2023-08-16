//
//  AdditionsRules.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

/// AdditionsRules` defines a set of rules to calculate the score of a password based on various environment-related criteria.
internal struct AdditionsRules {
    /// The collection of environment rules to be applied when calculating the score.
    let rules: [EnvironmentRules]
    
    /// Initializes a new instance of `AdditionsRules` with optional custom environment rules.
    ///
    /// - Parameter rules: The environment rules to be used for scoring. Defaults to a set of commonly used rules.
    init(rules: [EnvironmentRules] = [LenghtMeterRule(),
                                      ContainsUppercase(),
                                      ContainsLowercase(),
                                      ContainsNumbers(),
                                      ContainsSpecialKeywords(),
                                      MiddleNumberOrSymbol(),
                                      UniqueCharacterRule()]) {
        self.rules = rules
    }
}

extension AdditionsRules: Calculatable {
    /// Calculated all of the rules that need to addition.
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
