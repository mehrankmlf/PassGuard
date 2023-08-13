//
//  GuardianParsType.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit

public enum StrenghtType {
    case tooShort
    case veryWeak
    case weak
    case medium
    case strong
    case veryStrong
}

extension StrenghtType {
    public var typeDescription: String {
        switch self {
        case .tooShort:     return "Too Short"
        case .veryWeak:     return "Very Weak"
        case .weak:         return "Weak"
        case .medium:       return "Medium"
        case .strong:       return "Strong"
        case .veryStrong:   return "Very Strong"
        }
    }
    
    public var typeColor: UIColor {
        switch self {
        case .tooShort:   return .clear
        case .veryWeak:   return UIColor(red: 244, green: 60, blue: 43, alpha: 1)
        case .weak:       return .yellow
        case .medium:     return .yellow
        case .strong:     return .green
        case .veryStrong: return .green
        }
    }
}

internal enum RegexType {
    static let specialChar: String  = "!@#$%^&*()_+-=[]{}|;':\",./<>?\\"
    static let numbers: String      = "^[0-9]+$"
    static let onlyLetters: String  = "[^A-Za-zÀ-ÖØ-öø-ÿ]"
    static let onlyNumber: String   = "^[0-9]"
}


