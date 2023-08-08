//
//  RepeatCharacters.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

internal struct RepeatCharacters: EnvironmentRules {
    /// Check password contains repeated letter then count it and
    /// calculate it base on formula.
    ///
    /// ```
    /// print(RepeatCharacters.score("Helloworld")) // "-1"
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
        
        var count = 0
        var repeatedCharacters = 0
        let passwordArray = Array(password)
        let passwordLength = passwordArray.count
        
        for index in 0..<passwordLength {
            var charExists = false
            
            for b in 0..<passwordLength {
                if passwordArray[index] == passwordArray[b] && index != b { /* repeat character exists */
                    charExists = true
                    /*
                     Calculate increment deduction based on proximity to identical characters
                     Deduction is incremented each time a new match is discovered
                     Deduction amount is based on total password length divided by the
                     difference of distance between currently selected match
                     */
                    count += Int(abs(Double(passwordLength) / Double(b - index)))
                }
            }
            
            if charExists {
                repeatedCharacters += 1
                let uniqueCharacters = passwordLength - repeatedCharacters
                count = (uniqueCharacters != 0) ? Int(ceil(Double(count) / Double(uniqueCharacters))) : Int(ceil(Double(count)))
            }
        }
        return count
    }
}
