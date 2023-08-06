//
//  ConsecutiveLowercase.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

internal struct ConsecutiveLowercase: EnvironmentRules {
    /// Check password contains consecutive lowercacse letter then count it and
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
    static func score(_ password: String) -> Int {
        var count = 0
        var isConsecutive = false
        
        for character in password {
            if character.isLowercase {
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
