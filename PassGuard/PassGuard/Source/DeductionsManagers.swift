//
//  DeductionsManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/25/23.
//

import Foundation

open class DeductionsManager: Calculatable {
    func scoreCalculatore(_ password: String) -> Int {
        var totalScore: Int = 0

        totalScore += LetterOnly.score(password)
        totalScore += NumberOnly.score(password)
        totalScore += RepeatCharacters.score(password)
        totalScore += ConsecutiveUppercase.score(password)
        totalScore += ConsecutiveLowercase.score(password)
        totalScore += CosecutiveNumbers.score(password)
        totalScore += SequentialLetter.score(password)
        totalScore += SequentialNumber.score(password)
        totalScore += SequentialSymbol.score(password)
        
        return totalScore
    }
}
