//
//  UniqueCharacterRule.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

internal struct UniqueCharacterRule: EnvironmentRules {
    static func score(_ password: String) -> Int {
        let count = Set(password).count
        return min(count * 2, 5)
    }
}
