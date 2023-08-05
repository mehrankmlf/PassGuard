//
//  NumberOnly.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

struct NumberOnly: EnvironmentRules {
    static func score(_ password: String) -> Int {
        
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var count: Int = 0
        
        if Set(password).isSubset(of: numbers) {
            count += password.count
        }
        return count
    }
}
