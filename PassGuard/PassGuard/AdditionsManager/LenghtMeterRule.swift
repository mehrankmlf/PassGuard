//
//  LenghtMeterRule.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

internal struct LenghtMeterRule: EnvironmentRules {
    /// Check password lenght then multiply it by 4
    ///
    /// ```
    /// print(LenghtMeterRule.score("Helloworld")) // "40"
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
        let count = password.count
        return count * 4
    }
}


