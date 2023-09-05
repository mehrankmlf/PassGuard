//
//  PassGuardType.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/4/23.
//

import UIKit

protocol PasswordStrength {
    var description: String { get }
    var color: UIColor { get }
    func customTypeDescription(_ customDescriptions: [String]) -> String
}

public enum StrengthLevel: PasswordStrength {
    case tooShort, veryWeak, weak, medium, strong, veryStrong
}

extension StrengthLevel {
    public var description: String {
        switch self {
        case .tooShort:     return "Too Short"
        case .veryWeak:     return "Very Weak"
        case .weak:         return "Weak"
        case .medium:       return "Medium"
        case .strong:       return "Strong"
        case .veryStrong:   return "Very Strong"
        }
    }
    
    public var color: UIColor {
        switch self {
        case .tooShort:   return .clear
        case .veryWeak:   return UIColor(red: 244/255,
                                         green: 61/255,
                                         blue: 43/255,
                                         alpha: 1)
        case .weak:       return UIColor(red: 249/255,
                                         green: 188/255,
                                         blue: 55/255,
                                         alpha: 1)
        case .medium:     return UIColor(red: 202/255,
                                         green: 216/255,
                                         blue: 64/255,
                                         alpha: 1)
        case .strong:     return UIColor(red: 133/255,
                                         green: 193/255.0,
                                         blue: 71/255,
                                         alpha: 1)
        case .veryStrong: return UIColor(red: 85/255,
                                         green: 181/255,
                                         blue: 73/255,
                                         alpha: 1)
        }
    }
    
    func customTypeDescription(_ customDescriptions: [String]) -> String {
        switch self {
        case .tooShort:     return customDescriptions[0]
        case .veryWeak:     return customDescriptions[1]
        case .weak:         return customDescriptions[2]
        case .medium:       return customDescriptions[3]
        case .strong:       return customDescriptions[4]
        case .veryStrong:   return customDescriptions[5]
        }
    }
}




