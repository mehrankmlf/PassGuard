//
//  Manager.swift
//  Example
//
//  Created by Mehran Kamalifard on 8/5/23.
//

import Foundation

public protocol Manageable {
    func score(_ password: String) -> Int
    func strenghtMeter(_ score: Int) -> StrenghtType
}
