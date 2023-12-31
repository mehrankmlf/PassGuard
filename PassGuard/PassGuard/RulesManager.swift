//
//  RulesManager.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

/// RuleManagement responsible for managing password strength assessment based on addition and deduction rules.
internal struct RuleManagement {
    /// The rules for calculating additions.
    private let additionsRules: Calculatable
    /// The rules for calculating deductions.
    private let deductionsRules: Calculatable

    /// Initializes a new instance of `RuleManagement`.
    ///
    /// - Parameters:
    ///   - additionsRules: The rules for calculating additions. Defaults to `AdditionsRules()`.
    ///   - deductionsRules: The rules for calculating deductions. Defaults to `DeductionsRules()`.
    init(additionsRules: Calculatable = AdditionsRules(),
         deductionsRules: Calculatable = DeductionsRules()) {
        self.additionsRules = additionsRules
        self.deductionsRules = deductionsRules
    }
}

extension RuleManagement: Manageable {
    ///Determine state based on overall score that achived by addition and deduction the rules accrding the formula.
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: StrenghtType according to input password`.
    @discardableResult
    internal func score(_ password: String) -> Int {
//        var finalScore: Int = 0
        
        // Calculate the addition and deduction scores for the password.
        let additionsScore = self.additionsRules.scoreCalculatore(password)
        let deductionsScore = self.deductionsRules.scoreCalculatore(password)
        
        // Calculate the final score without exceeding 100 or going below 0.
        let finalScore = max(0, min(100, additionsScore - deductionsScore))
        return finalScore
    }
    
    ///Determine complexity based on overall score.
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: StrenghtType according to input password`.
    internal func strenghtMeter(_ score: Int) -> StrengthLevel {
        
        switch score {
        case 0..<20:
            return .veryWeak
        case 20..<40:
            return .weak
        case 40..<60:
            return .medium
        case 60..<80:
            return .strong
        case 80...100:
            return .veryStrong
        default:
            return .tooShort
        }
    }
}

