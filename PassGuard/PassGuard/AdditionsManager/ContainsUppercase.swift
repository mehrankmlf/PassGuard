//
//  ContainsUppercase.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

struct ContainsUppercase: EnvironmentRules {
    static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        
        let passwordLength = password.count
        
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let uppercaseCount = password.components(separatedBy: uppercaseLetters.inverted).joined().count
        if uppercaseCount > 0 {
            return (passwordLength - uppercaseCount) * 2
        }
        return 0
    }
}
