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
    private var password: String? {
        didSet {
            password = password?.trim()
        }
    }
    
    private var customDescription: [String]?
    
    /// Gives the score according to the input in order to use in progress view
    public var score: Int {
        guard let score = self.totalScore() else {return 0}
        return score
    }
    /// Gives the state description base on score. "Strong"
    public var typeDescription: String {
        guard let type = self.strengthMeter() else { return "" }
        if let customDesc = customDescription, customDesc.count == 6 {
            return type.customTypeDescription(
                customDesc[0], customDesc[1], customDesc[2],
                customDesc[3], customDesc[4], customDesc[5])
        } else {
            return type.typeDescription
        }
    }
    /// Gives the state color base on score. weak = .red
    public var typeColor: UIColor {
        guard let type = self.strengthMeter() else {return .clear}
        return type.typeColor
    }
    
    internal init(ruleManager: Manageable = RuleManagement()) {
        self.ruleManager = ruleManager
    }
    
    public convenience init(password: String? = nil, customDescription: [String]? = nil) {
        self.init(ruleManager: RuleManagement())
        self.password = password
        self.customDescription = customDescription
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
        return self.ruleManager.score(password)
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
        let score = self.ruleManager.score(password)
        return self.ruleManager.strenghtMeter(score)
    }
}




