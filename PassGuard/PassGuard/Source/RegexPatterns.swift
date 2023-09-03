//
//  RegexPatterns.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 8/30/23.
//

import Foundation

// This Swift enum, `RegexPattern`, defines static regular expression patterns
// commonly used for various purposes, such as validating input or searching for
// specific patterns in text.
internal enum RegexPattern {
    // A string containing various special characters often used for validation
    // or filtering purposes.
    static let specialChar: String  = "!@#$%^&*()_+-=[]{}|;':\",./<>?\\"
    // A regular expression pattern to match strings containing only numbers (0-9).
    static let numbers: String      = "^[0-9]+$"
    // A regular expression pattern to match strings containing only letters,
    // including accented characters (A-Za-zÀ-ÖØ-öø-ÿ).
    static let onlyLetters: String  = "[^A-Za-zÀ-ÖØ-öø-ÿ]"
    // A regular expression pattern to match strings starting with a number (0-9).
    static let onlyNumber: String   = "^[0-9]"
}
