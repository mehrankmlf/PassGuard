//
//  SequentialSymbol.swift
//  Example
//
//  Created by Mehran Kamalifard on 8/5/23.
//

import Foundation

internal struct SequentialSymbol: EnvironmentRules {
    /// Check password contains sequnetial symbol then count it and
    /// calculate it base on formula (forward and reverse). 
    ///
    /// ```
    /// print(RepeatCharacters.score("!@#$%^")) // "-12"
    /// ```
    ///
    ////// > formula: The formula based on which the score is calculated
    /// > -(n*3)
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
     func score(_ password: String) -> Int {
        guard password.count >= 2 else {
            return 0
        }
        
        let symbol = "!@#$%^&*()_+"
        var count = 0
        
        for index in 0..<8 {
            let startIndex = symbol.index(symbol.startIndex, offsetBy: index)
            let endIndex = symbol.index(startIndex, offsetBy: 3)
            let stringFwd = String(symbol[startIndex..<endIndex])
            let stringRev = String(stringFwd.reversed())
            
            if password.lowercased().contains(stringFwd) || password.lowercased().contains(stringRev) {
                count += 1
            }
        }
        return count * 3
    }
}
