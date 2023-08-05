//
//  ConsecutiveLowercase.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

struct ConsecutiveLowercase: EnvironmentRules {
    static func score(_ password: String) -> Int {
        var count = 0
        var isConsecutive = false
        
        for character in password {
            if character.isLowercase {
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
