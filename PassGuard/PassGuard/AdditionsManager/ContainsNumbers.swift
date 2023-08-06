//
//  ContainsNumbers.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

internal struct ContainsNumbers: EnvironmentRules {
    /// Check password contains number digits then count it and multiply it by 4
    ///
    /// ```
    /// print(ContainsNumbers.score("Helloworld123")) // "12"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > +(n*4)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        
        let numbers = CharacterSet.decimalDigits
        let count = password.components(separatedBy: numbers.inverted).joined().count
        return count * 4
    }
}
