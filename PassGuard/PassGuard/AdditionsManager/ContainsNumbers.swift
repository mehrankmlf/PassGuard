//
//  ContainsNumbers.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

struct ContainsNumbers: EnvironmentRules {
   static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        let numbers = CharacterSet.decimalDigits
        let count = password.components(separatedBy: numbers.inverted).joined().count
        return count * 4
    }
}
