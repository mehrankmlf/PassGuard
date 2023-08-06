//
//  UniqueCharacterRule.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

internal struct UniqueCharacterRule: EnvironmentRules {
    /// Check password contains unique and non reapeted letter then
    /// count it and multiply it by 2
    ///
    /// ```
    /// print(MiddleNumberOrSymbol.score("Helloworld")) // "12"
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
        let count = Set(password).count
        return min(count * 2, 5)
    }
}
