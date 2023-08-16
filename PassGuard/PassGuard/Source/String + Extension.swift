//
//  String + Extension.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 8/13/23.
//

import Foundation

/// An extension on `String` providing a method to trim leading and trailing white spaces.
extension String {
    /// Trim leading and trailing white spaces from the string.
    ///
    /// - Returns: A new string with leading and trailing white spaces removed.
    func trim() -> String{
       return self.trimmingCharacters(in: CharacterSet.whitespaces)
     }
}
