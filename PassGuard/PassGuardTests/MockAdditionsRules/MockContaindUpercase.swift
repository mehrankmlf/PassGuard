//
//  MockContaindUpercase.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/6/23.
//

import Foundation
@testable import PassGuard

struct MockContaindUpercase: EnvironmentRules {
    static var mockedScore: Int?
    
    static func score(_ password: String) -> Int {
        return mockedScore ?? 0
    }
}
