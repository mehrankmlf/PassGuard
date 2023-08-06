//
//  ContainsSpecialKeywords.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

internal struct ContainsSpecialKeywords: EnvironmentRules {
    /// Check password contains special letter then count it and multiply it by 6
    ///
    /// ```
    /// print(ContainsSpecialKeywords.score("Helloworld!@#")) // "18"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > +(n*6)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        
        let specialCharacterSet = CharacterSet(charactersIn: RegexType.specialChar)
        let count = password.filter { specialCharacterSet.contains($0.unicodeScalars.first!) }.count
        return count * 6
    }
}
