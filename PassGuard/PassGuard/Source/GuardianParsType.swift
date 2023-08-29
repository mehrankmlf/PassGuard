//
//  GuardianParsType.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit

protocol Typeable {
    var typeDescription: String { get }
    var typeColor: UIColor { get }
    func desc(_ tooShort: String,
                     _ veryWeak: String,
                     _ weak: String,
                     _ medium: String,
                     _ strong: String,
                     _ veryStrong: String) -> String
}

public enum StrenghtType: Typeable {
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
        case .veryWeak:   return UIColor(red: 244, green: 61, blue: 43, alpha: 1)
        case .weak:       return UIColor(red: 249, green: 188, blue: 55, alpha: 1)
        case .medium:     return UIColor(red: 202, green: 216, blue: 64, alpha: 1)
        case .strong:     return UIColor(red: 133, green: 193, blue: 71, alpha: 1)
        case .veryStrong: return UIColor(red: 85, green: 181, blue: 73, alpha: 1)
        }
    }

    func desc(_ tooShort: String,
                     _ veryWeak: String,
                     _ weak: String,
                     _ medium: String,
                     _ strong: String,
                     _ veryStrong: String) -> String {
        switch self {
        case .tooShort:     return tooShort
        case .veryWeak:     return veryWeak
        case .weak:         return weak
        case .medium:       return medium
        case .strong:       return strong
        case .veryStrong:   return veryWeak
        }
    }
}

internal enum RegexType {
    static let specialChar: String  = "!@#$%^&*()_+-=[]{}|;':\",./<>?\\"
    static let numbers: String      = "^[0-9]+$"
    static let onlyLetters: String  = "[^A-Za-zÀ-ÖØ-öø-ÿ]"
    static let onlyNumber: String   = "^[0-9]"
}


