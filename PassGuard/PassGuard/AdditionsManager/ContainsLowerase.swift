//
//  ContainsLowercase.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

internal struct ContainsLowercase: EnvironmentRules {
    /// Check password contains lowercase letter then count it and multiply it by 2
    ///
    /// ```
    /// print(ContainsLowercase.score("Helloworld")) // "2"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > +((lenght-n)*2)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        
        let passwordLength = password.count
        
        let lowecaseLetters = CharacterSet.lowercaseLetters
        let lowecaseCount = password.components(separatedBy: lowecaseLetters.inverted).joined().count
        if lowecaseCount > 0 {
            return (passwordLength - lowecaseCount) * 2
        }
        return 0
    }
}
