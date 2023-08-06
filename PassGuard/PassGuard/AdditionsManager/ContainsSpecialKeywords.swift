//
//  ContainsSpecialKeywords.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation

internal struct ContainsSpecialKeywords: EnvironmentRules {
    static func score(_ password: String) -> Int {
        guard !password.isEmpty else {return 0}
        
        let specialCharacterSet = CharacterSet(charactersIn: RegexType.specialChar)
        let count = password.filter { specialCharacterSet.contains($0.unicodeScalars.first!) }.count
        return count * 6
    }
}
