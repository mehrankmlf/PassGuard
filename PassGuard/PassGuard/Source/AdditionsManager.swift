//
//  AdditionsManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

internal struct AdditionsManager: Calculatable {
    /// Calculated all of the rules that need to addition.
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
     func scoreCalculatore(_ password: String) -> Int {
        var totalScore: Int = 0

        totalScore += LenghtMeterRule.score(password)
        totalScore += ContainsUppercase.score(password)
        totalScore += ContainsLowercase.score(password)
        totalScore += ContainsNumbers.score(password)
        totalScore += ContainsSpecialKeywords.score(password)
        totalScore += MiddleNumberOrSymbol.score(password)
        totalScore += UniqueCharacterRule.score(password)

        return totalScore
    }
}
