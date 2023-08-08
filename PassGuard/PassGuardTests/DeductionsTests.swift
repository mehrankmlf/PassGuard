//
//  DeductionsTests.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/6/23.
//

import XCTest
@testable import PassGuard

final class DeductionsTests: XCTestCase {

    func testLetterOnly_withEmptyPassword_shouldReturnValidScore() {
        let rule = LetterOnly()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testLetterOnly_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = LetterOnly()
        let score = rule.score("Helloworld")
        XCTAssertEqual(score, 10,  "Score for 'Helloworld' should be 10")
    }
    
    func testNumberOnly_withEmptyPassword_shouldReturnValidScore() {
        let rule = NumberOnly()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testNumberOnly_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = NumberOnly()
        let score = rule.score("123456789")
        XCTAssertEqual(score, 9,  "Score for '123456789' should be 9")
    }
    
    func testRepeatChar_withEmptyPassword_shouldReturnValidScore() {
        let rule = RepeatCharacters()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testRepeatChar_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = RepeatCharacters()
        let score = rule.score("Helloworld")
        XCTAssertEqual(score, 1,  "Score for 'Helloworld' should be 1")
    }
    
    func testConsecutiveUppercase_withEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveUppercase()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testConsecutiveUppercase_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveUppercase()
        let score = rule.score("HELOOworld")
        XCTAssertEqual(score, 8,  "Score for 'HELOOworld' should be 8")
    }
    
    func testConsecutiveLowercase_withEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveLowercase()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testConsecutiveLowercase_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveLowercase()
        let score = rule.score("HELOOworld")
        XCTAssertEqual(score, 8,  "Score for 'HELOOworld' should be 8")
    }
    
    func testConsecutiveNumber_withEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveNumbers()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testConsecutiveNumber_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = ConsecutiveNumbers()
        let score = rule.score("HELOOworld123456")
        XCTAssertEqual(score, 10,  "Score for 'HELOOworld123456' should be 10")
    }
    
    func testSequentialLetter_withEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialLetter()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testSequentialLetter_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialLetter()
        let score = rule.score("abcdeHello")
        XCTAssertEqual(score, 9,  "Score for 'abcdeHello' should be 9")
    }
    
    func testSequentialNumber_withEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialNumber()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testSequentialNumber_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialNumber()
        let score = rule.score("abcdeHello123456")
        XCTAssertEqual(score, 12,  "Score for 'abcdeHello123456' should be 12")
    }
    
    func testSequentialSymbol_withEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialSymbol()
        let score = rule.score("")
        XCTAssertEqual(score, 0, "Score for empty password should be 0")
    }
    
    func testSequentialSymbol_withNonEmptyPassword_shouldReturnValidScore() {
        let rule = SequentialSymbol()
        let score = rule.score("abcdeHello!@#$%")
        XCTAssertEqual(score, 9,  "Score for 'abcdeHello!@#$%' should be 9")
    }
}
