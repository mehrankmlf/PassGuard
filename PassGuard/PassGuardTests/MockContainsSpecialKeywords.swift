//
//  MockContainsSpecialKeywords.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/8/23.
//

import Foundation
@testable import PassGuard

struct MockContainsSpecialKeywords: EnvironmentRules {
    var mockedScore: Int?
    
    func score(_ password: String) -> Int {
        return mockedScore ?? 0
    }
}
