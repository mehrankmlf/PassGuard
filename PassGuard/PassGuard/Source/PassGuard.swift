//
//  PassGuard.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit

open class PassGuard {
    
    internal var ruleManager: Manageable
    
    internal var password: String?
    
    public var totalScore: Int {
        guard let score = self.score() else {return 0}
        return score
    }
    
    public var typeDescription: String {
        guard let type = self.strenghtMeter() else {return ""}
        return type.typeDescription
    }
    
    public var typeColor: UIColor {
        guard let type = self.strenghtMeter() else {return .clear}
        return type.typeColor
    }
    
    internal init(ruleManager: Manageable = RuleManagement()) {
        self.ruleManager = ruleManager
    }
    
    public convenience init(password: String? = nil) {
        self.init(ruleManager: RuleManagement())
        self.password = password
    }
    /// Gives the state according to the input
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: state according to input password`.
    ///
    internal func score() -> Int? {
        guard let password = self.password else {return 0}
        let trimmedPassword = password.trim()
        return self.ruleManager.score(trimmedPassword)
    }
    
    /// Gives the state according to the input
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: state according to input password`.
    ///
    internal func strenghtMeter() -> StrenghtType? {
        guard let password = self.password else {return .tooShort}
        let trimmedPassword = password.trim()
        let score = self.ruleManager.score(trimmedPassword)
        return self.ruleManager.strenghtMeter(score)
    }
}
