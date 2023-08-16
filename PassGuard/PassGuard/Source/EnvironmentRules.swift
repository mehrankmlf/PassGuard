//
//  Rules.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

/// The `EnvironmentRules` protocol defines a set of rules to evaluate the strength of a password based on various environmental criteria.
protocol EnvironmentRules {
    /// Calculate the score of a password based on the rule's evaluation.
    ///
    /// - Parameter password: The password to be evaluated.
    /// - Returns: The calculated score according to the rule's evaluation of the input password.
     func score(_ password: String) -> Int
}
