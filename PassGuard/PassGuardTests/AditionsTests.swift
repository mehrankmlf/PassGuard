//
//  AditionsTests.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/6/23.
//

import XCTest
@testable import PassGuard

final class AditionsTests: XCTestCase {

    func testLenghtMeter_withEmptyPassword_shouldReturnValidScore() {
        let rule = LenghtMeterRule()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testLenghtMeter_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = LenghtMeterRule()
        let score = rule.score("Helloworld")
        XCTAssertEqual(score, 40,  "Score for 'Helloworld' should be 40")
    }
    
    func testContainsUppercase_withEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsUppercase()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testContainsUppercase_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsUppercase()
        let score = rule.score("Helloworld")
        XCTAssertEqual(score, 18, "Score for 'Helloworld' should be 18")
    }
    
    func testContainsLowercase_withEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsLowercase()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testContainsLowercase_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsLowercase()
        let score = rule.score("Helloworld")
        XCTAssertEqual(score, 2, "Score for 'Helloworld' should be 2")
    }
    
    func testContainsNumber_withEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsNumbers()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testContainsNumber_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsNumbers()
        let score = rule.score("Helloworld123456")
        XCTAssertEqual(score, 24, "Score for 'Helloworld123456' should be 24")
    }
    
    func testSpecialKeyboard_withEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsSpecialKeywords()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testSpecialKeyboard_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ContainsSpecialKeywords()
        let score = rule.score("Hellowor#$%123456")
        XCTAssertEqual(score, 18, "Score for 'Hellowor' should be 18")
    }
    
    func testMiddleNumberorSymbol_withEmptyPassword_shouldReturnValidScore() {
        let rule = MiddleNumberOrSymbol()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testMiddleNumberorSymbol_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = MiddleNumberOrSymbol()
        let score = rule.score("Hellowor#$%12345Hellowor6")
        XCTAssertEqual(score, 16, "Score for 'Hellowor#$%12345Hellowor6' should be 16")
    }
    
    func testUniqueCharacter_withEmptyPassword_shouldReturnValidScore() {
        let rule = UniqueCharacterRule()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testUniqueCharacter_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = UniqueCharacterRule()
        let score = rule.score("Helloword")
        XCTAssertEqual(score, 5, "Score for 'Helloword' should be 5")
    }
}
