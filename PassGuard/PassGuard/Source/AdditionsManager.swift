//
//  AdditionsManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

internal struct AdditionsManager {
    
    let rules: [EnvironmentRules]
    
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

extension AdditionsManager: Calculatable {
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
