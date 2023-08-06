//
//  AdditionsManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

internal struct AdditionsManager: Calculatable {
    
    internal func scoreCalculatore(_ password: String) -> Int {
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
