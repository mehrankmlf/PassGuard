//
//  Manager.swift
//  Example
//
//  Created by Mehran Kamalifard on 8/5/23.
//

import Foundation

protocol Manageable {
    func check(_ password: String) -> StrenghtType
    func strenghtMeter(_ score: Int) -> StrenghtType
}
