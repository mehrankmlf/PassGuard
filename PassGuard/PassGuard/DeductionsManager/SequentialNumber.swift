//
//  SequentialNumber.swift
//  Example
//
//  Created by Mehran Kamalifard on 8/5/23.
//

import Foundation

struct SequentialNumber: EnvironmentRules {
    static func score(_ password: String) -> Int {
        guard password.count >= 2 else {
            return 0
        }
        
        let numeric = "0123456789"
        var count = 0
        
        for index in 0..<8 {
            let startIndex = numeric.index(numeric.startIndex, offsetBy: index)
            let endIndex = numeric.index(startIndex, offsetBy: 3)
            let stringFwd = String(numeric[startIndex..<endIndex])
            let stringRev = String(stringFwd.reversed())
            
            if password.lowercased().contains(stringFwd) || password.lowercased().contains(stringRev) {
                count += 1
            }
        }
        return count * 3
    }
}
