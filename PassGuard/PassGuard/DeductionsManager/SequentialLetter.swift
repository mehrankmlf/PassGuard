//
//  SequentialLetter.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/30/23.
//

import Foundation

struct SequentialLetter: EnvironmentRules {
    static func score(_ password: String) -> Int {
        guard password.count >= 2 else {
            return 0
        }
        
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        var count = 0
        
        for index in 0..<23 {
            let startIndex = alphabet.index(alphabet.startIndex, offsetBy: index)
            let endIndex = alphabet.index(startIndex, offsetBy: 3)
            let stringFwd = String(alphabet[startIndex..<endIndex])
            let stringRev =  String(stringFwd.reversed())
            
            if password.lowercased().contains(stringFwd) || password.lowercased().contains(stringRev) {
                count += 1
            }
        }
        return count * 3
    }
}
