//
//  Rules.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

protocol EnvironmentRules {
    static func score(_ password: String) -> Int
}
