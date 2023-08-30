//
//  CosecutiveNumbers.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/30/23.
//

import Foundation

internal struct ConsecutiveNumbers: EnvironmentRules {
    /// Check password contains consecutive nubmer then count it and
    /// calculate it base on formula.
    ///
    /// ```
    /// print(RepeatCharacters.score("HELLOworld")) // "-8"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > -(n*2)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
     func score(_ password: String) -> Int {
        var count = 0
        var isConsecutive = false
        
        for character in password {
            if character.isNumber {
                if isConsecutive {
                    count += 1
                } else {
                    isConsecutive = true
                }
            } else {
                isConsecutive = false
            }
        }
        return count * 2
    }
}
