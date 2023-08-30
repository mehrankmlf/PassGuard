//
//  RegexPatterns.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 8/30/23.
//

import Foundation

internal enum RegexPattern {
    static let specialChar: String  = "!@#$%^&*()_+-=[]{}|;':\",./<>?\\"
    static let numbers: String      = "^[0-9]+$"
    static let onlyLetters: String  = "[^A-Za-zÀ-ÖØ-öø-ÿ]"
    static let onlyNumber: String   = "^[0-9]"
}
