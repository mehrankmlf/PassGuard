//
//  CosecutiveNumbers.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/30/23.
//

import Foundation

struct CosecutiveNumbers: EnvironmentRules {
    static func score(_ password: String) -> Int {
        var count = 0
        var isConsecutive = false
        
        for character in password {
            if character.isNumber {
                if isConsecutive {
                    count += 1
                } else {
                    isConsecutive = true
                }
            } else {
                isConsecutive = false
            }
        }
        return count * 2
    }
}
