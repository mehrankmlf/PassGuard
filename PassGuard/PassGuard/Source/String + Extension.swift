//
//  String + Extension.swift
//  PassGuard
//
//  Created by Mehran Kamalifard on 8/13/23.
//

import Foundation

extension String {
    func trim() -> String{
       return self.trimmingCharacters(in: CharacterSet.whitespaces)
     }
}
