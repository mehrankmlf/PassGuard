//
//  RulesManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

internal struct RuleManagement {

    private let additionsRules: Calculatable
    private let deductionsRules: Calculatable

    init(additionsRules: Calculatable = AdditionsRules(),
         deductionsRules: Calculatable = DeductionsRules()
    ) {
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
        
        var finalScore: Int = 0
        
        finalScore += self.additionsRules.scoreCalculatore(password)
        finalScore -= self.deductionsRules.scoreCalculatore(password)
        
        return finalScore
    }
    
    ///Determine complexity based on overall score.
    ///
    /// - Parameters:
    ///     - password: The password to be welcomed.
    ///
    /// - Returns: StrenghtType according to input password`.
    internal func strenghtMeter(_ score: Int) -> StrenghtType {

        /* The final score might get
         beyond 100 scores base on
         calculated scores.
         */
        let finalScore = max(0, min(100, score))
        
        switch finalScore {
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
