//
//  GuardianParsType.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import Foundation

enum StrenghtType {
    case veryWeak
    case weak
    case medium
    case strong
    case veryStrong
}

extension StrenghtType {
    var description: String {
        switch self {
        case .veryWeak: return "very Weak"
        case .weak: return "Weak"
        case .medium: return "Medium"
        case .strong: return "Strong"
        case .veryStrong: return "Very Strong"
        }
    }
}

enum RegexType {
    static let specialChar: String = "!@#$%^&*()_+-=[]{}|;':\",./<>?\\"
    static let numbers: String = "^[0-9]+$"
    static let onlyLetters: String = "[^A-Za-zÀ-ÖØ-öø-ÿ]"
    static let onlyNumber: String = "^[0-9]"
}


