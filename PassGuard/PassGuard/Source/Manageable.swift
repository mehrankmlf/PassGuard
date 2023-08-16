//
//  Manager.swift
//  Example
//
//  Created by Mehran Kamalifard on 8/5/23.
//

import Foundation

/// The `Manageable` protocol defines methods to manage password strength assessment and categorize it into strength types.
public protocol Manageable {
    /// Calculate the overall score of a given password.
    ///
    /// - Parameter password: The password to be evaluated.
    /// - Returns: The calculated password score.
    func score(_ password: String) -> Int
    /// Determine the strength type of a password based on its score.
    ///
    /// - Parameter score: The overall score calculated from password rules.
    /// - Returns: The strength type of the password.
    func strenghtMeter(_ score: Int) -> StrenghtType
}
