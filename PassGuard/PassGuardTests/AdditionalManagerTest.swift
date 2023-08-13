//
//  AdditionalManagerTest.swift
//  PassGuardTests
//
//  Created by Mehran Kamalifard on 8/8/23.
//

import XCTest
@testable import PassGuard

final class AdditionalManagerTest: XCTestCase {
    
    var sut: Calculatable!
    
    override func setUp() {
        sut = AdditionsRules()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_AdditionalManagerCalculation_ShouldReturnValidInt() {
        var mockLenghtMeter = MockLenghtMeter()
        mockLenghtMeter.mockedScore = 10
        
        var mockContainsUpercase = MockContainsUpercase()
        mockContainsUpercase.mockedScore = 5
        
        var mockContainsLowercase = MockContainsLowercase()
        mockContainsLowercase.mockedScore = 30
        
        var mockContainsNumber = MockContainsNumber()
        mockContainsNumber.mockedScore = 10
        
        var mockContainsSpecialKeywords = MockContainsSpecialKeywords()
        mockContainsSpecialKeywords.mockedScore = 40
        
        var mockMiddleNumberOrSymbol = MockMiddleNumberOrSymbol()
        mockMiddleNumberOrSymbol.mockedScore = 10
        
        var mockUniqueCharacterRule = MockUniqueCharacterRule()
        mockUniqueCharacterRule.mockedScore = 5
        
        let rules: [EnvironmentRules] = [mockLenghtMeter,
                                         mockContainsUpercase,
                                         mockContainsLowercase,
                                         mockContainsNumber,
                                         mockContainsSpecialKeywords,
                                         mockMiddleNumberOrSymbol,
                                         mockUniqueCharacterRule]
        
        let manager = AdditionsRules(rules: rules)
        
        let score = manager.scoreCalculatore("Helloword")
        
        XCTAssertEqual(score, 110, "Score should be sum of mock scores (110)")
    }
}

