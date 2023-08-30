//
//  NumberOnly.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

internal struct NumberOnly: EnvironmentRules {
    /// Check password contains only number then count it and subtracts it by password.count
    ///
    /// ```
    /// print(LetterOnly.score("123456")) // "-6"
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
        
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var count: Int = 0
        
        if Set(password).isSubset(of: numbers) {
            count += password.count
        }
        return count
    }
}
