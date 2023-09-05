//
//  RuleManagerTest.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/8/23.
//

import XCTest
@testable import PassGuard

final class RuleManagerTest: XCTestCase {
   
   var sut: Manageable!
 
   override func setUp() {
      sut = RuleManagement()
   }
   
   override func tearDown() {
      sut = nil
      super.tearDown()
   }
   
   func testRuleManager_checkScore_ShouldReturnState() {
//      XCTAssertEqual(sut.check("Helloword"), .weak)
//      XCTAssertEqual(sut.check("Helloword!@#"), .veryStrong)
//      XCTAssertEqual(sut.check("Helloword233"), .strong)
   }
   
   func testRuleManager_checkStrenghtMeter_ShouldReturnState() {
      
      XCTAssertEqual(sut.strenghtMeter(0), .veryWeak)
      XCTAssertEqual(sut.strenghtMeter(30), .weak)
      XCTAssertEqual(sut.strenghtMeter(60), .strong)
      XCTAssertEqual(sut.strenghtMeter(85), .veryStrong)
      XCTAssertEqual(sut.strenghtMeter(101), .tooShort)
      XCTAssertEqual(sut.strenghtMeter(-10), .tooShort)
   }
}
