//
//  RepeatCharacters.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/26/23.
//

import Foundation

struct RepeatCharacters: EnvironmentRules {
    static func score(_ password: String) -> Int {
        var nRepInc = 0
        var nRepChar = 0
        let arrPwd = Array(password)
        let arrPwdLen = arrPwd.count
        
        for a in 0..<arrPwdLen {
            var bCharExists = false
            
            for b in 0..<arrPwdLen {
                if arrPwd[a] == arrPwd[b] && a != b { /* repeat character exists */
                    bCharExists = true
                    /*
                     Calculate increment deduction based on proximity to identical characters
                     Deduction is incremented each time a new match is discovered
                     Deduction amount is based on total password length divided by the
                     difference of distance between currently selected match
                     */
                    nRepInc += Int(abs(Double(arrPwdLen) / Double(b - a)))
                }
            }
            
            if bCharExists {
                nRepChar += 1
                let nUnqChar = arrPwdLen - nRepChar
                nRepInc = (nUnqChar != 0) ? Int(ceil(Double(nRepInc) / Double(nUnqChar))) : Int(ceil(Double(nRepInc)))
            }
        }
        return nRepInc
    }
}
