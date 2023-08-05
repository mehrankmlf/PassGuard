//
//  GuardianPars.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

public class GuardianPars {
    
    let manager = RuleManagement()

    public static func strenghMeter(_ password: String) -> StrenghtType {
        let manager = RuleManagement()
        return  manager.check(password)
    }
}
