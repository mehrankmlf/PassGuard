//
//  GuardianPars.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

public struct GuardianPars {
    /// Gives the password state according to the input
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: state according to input password`.
    public static func strenghMeter(_ password: String) -> StrenghtType {
        return  RuleManagement.shared.check(password)
    }
}
