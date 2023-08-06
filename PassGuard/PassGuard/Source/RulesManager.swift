//
//  RulesManager.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

internal struct RuleManagement {
    
    static let shared = RuleManagement()
    
    private var additionsManager: Calculatable
    private var deductionsManager: Calculatable

    init(additionsManager: Calculatable = AdditionsManager(),
         deductionsManager: Calculatable = DeductionsManager()
    ) {
        self.additionsManager = additionsManager
        self.deductionsManager = deductionsManager
    }
}

extension RuleManagement: Manageable {
    
    @discardableResult
    internal func check(_ password: String) -> StrenghtType {
        
        var finalScore: Int = 0
        
        finalScore += self.additionsManager.scoreCalculatore(password)
        finalScore -= self.deductionsManager.scoreCalculatore(password)
        
        return self.strenghtMeter(finalScore)
    }
    
    internal func strenghtMeter(_ score: Int) -> StrenghtType {
        
        var finalScore = score
        
        if score > 100 {
            finalScore = 100
        }else if score < 0 {
            finalScore = 0
        }
        
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
