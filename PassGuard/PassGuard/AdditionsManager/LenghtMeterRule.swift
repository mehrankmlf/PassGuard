//
//  LenghtMeterRule.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/5/23.
//

import Foundation
import Combine

struct LenghtMeterRule: EnvironmentRules {
    static func score(_ password: String) -> Int {
         let count = password.count
         return count * 4
     }
}


