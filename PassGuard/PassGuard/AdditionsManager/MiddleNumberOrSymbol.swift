//
//  MiddleNumberOrSymbol.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

internal struct MiddleNumberOrSymbol: EnvironmentRules {
    /// Check password contains middle number and special letters then
    ///  count it and multiply it by 2
    ///
    /// ```
    /// print(MiddleNumberOrSymbol.score("Hello!@345world")) // "10"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > +(n*2)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    static func score(_ password: String) -> Int {
        guard !password.isEmpty,
              password.count > 3
        else {return 0}
        
        var count: Int = 0
        
        var input = password
        input.removeFirst()
        input.removeLast()
        
        let specialCharacterSet = CharacterSet(charactersIn: RegexType.specialChar)
        let specialCharacterCount = input.filter { specialCharacterSet.contains($0.unicodeScalars.first!) }.count
        count += specialCharacterCount
        
        let numberCharacterSet = CharacterSet.decimalDigits
        let numberCharacterCount = input.components(separatedBy: numberCharacterSet.inverted).joined().count
        count += numberCharacterCount
        
        return count * 2
    }
}
