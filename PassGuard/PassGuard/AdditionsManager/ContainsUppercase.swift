//
//  ContainsUppercase.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

internal struct ContainsUppercase: EnvironmentRules {
    /// Check password contains uppercase letter then count it and multiply it by 2
    ///
    /// ```
    /// print(ContainsUppercase.score("Helloworld")) // "18"
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
        
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let uppercaseCount = password.components(separatedBy: uppercaseLetters.inverted).joined().count
        if uppercaseCount > 0 {
            return (passwordLength - uppercaseCount) * 2
        }
        return 0
    }
}
