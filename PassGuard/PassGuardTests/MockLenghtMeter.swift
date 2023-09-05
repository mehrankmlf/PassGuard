//
//  MockLenghtMeter.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/6/23.
//

import Foundation
@testable import PassGuard

struct MockLenghtMeter: EnvironmentRules {
    var mockedScore: Int?
    
    func score(_ password: String) -> Int {
        return mockedScore ?? 0
    }
}
