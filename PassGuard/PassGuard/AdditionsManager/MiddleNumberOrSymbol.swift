//
//  MiddleNumberOrSymbol.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/24/23.
//

import Foundation

struct MiddleNumberOrSymbol: EnvironmentRules {
    static func score(_ password: String) -> Int {
        guard !password.isEmpty,
               password.count > 3
        else {return 0}
        
        var count: Int = 0
        
        var input = password
        input.removeFirst()
        input.removeLast()
        
        let specialCharacterSet = CharacterSet(charactersIn: RegexType.specialChar)
        let specialCharacterCount = input.filter { specialCharacterSet.contains($0.unicodeScalars.first!) }.count
        count += specialCharacterCount

        let numberCharacterSet = CharacterSet.decimalDigits
        let numberCharacterCount = input.components(separatedBy: numberCharacterSet.inverted).joined().count
        count += numberCharacterCount

        return count * 2
    }
}
