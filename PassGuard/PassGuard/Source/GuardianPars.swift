//
//  GuardianPars.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

public struct GuardianPars {
    
    public static func strenghMeter(_ password: String) -> StrenghtType {
        return  RuleManagement.shared.check(password)
    }
}
