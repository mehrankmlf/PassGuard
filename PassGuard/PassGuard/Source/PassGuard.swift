//
//  PassGuard.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit

/// This class provides an easy-to-use PassGuard Framework.
public class PassGuard {
    
    private var ruleManager: Manageable
    
    /// Utilize to get input from outside
    private var password: String?
    /// Gives the score according to the input in order to use in progress view
    public var score: Int {
        guard let score = self.totalScore() else {return 0}
        return score
    }
    /// Gives the state description base on score. "Strong"
    public var typeDescription: String {
        guard let type = self.strengthMeter() else {return ""}
        return type.typeDescription
    }
    /// Gives the state color base on score. weak = .red
    public var typeColor: UIColor {
        guard let type = self.strengthMeter() else {return .clear}
        return type.typeColor
    }
    
    internal init(ruleManager: Manageable = RuleManagement()) {
        self.ruleManager = ruleManager
    }
    
    public convenience init(password: String? = nil) {
        self.init(ruleManager: RuleManagement())
        self.password = password
    }
    /// Gives the totalScore according to the input
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: score according to input password`.
    ///
    internal func totalScore() -> Int? {
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
    internal func strengthMeter() -> StrenghtType? {
        guard let password = self.password else {return .tooShort}
        let trimmedPassword = password.trim()
        let score = self.ruleManager.score(trimmedPassword)
        return self.ruleManager.strenghtMeter(score)
    }
}




