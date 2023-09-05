//
//  Calculatable.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

/// The `Calculatable` protocol defines a method for calculating a score based on specific criteria.
protocol Calculatable {
    /// Calculate a score based on the provided password and specific criteria.
    ///
    /// - Parameter password: The password to be evaluated.
    /// - Returns: The calculated score according to the criteria.
    func scoreCalculatore(_ password: String) -> Int
}
