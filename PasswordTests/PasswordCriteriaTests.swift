//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Oscar Cristaldo on 2022-06-27.
//

import XCTest

@testable import Password

// MARK: - LengthCriteria
class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

// MARK: - NoSpaceCriteria
class PasswordNoSpaceCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNoMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
}

// MARK: - LengthAndNoSpaceCriteria
class PasswordLengthAndNoSpaceCriteriaTests: XCTestCase {
    func testlengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testlengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet(" 123456"))
    }
}

// MARK: - UppercaseCriteria
class PasswordUppercaseCriteriaTests: XCTestCase {
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
}

// MARK: - LowercaseCriteria
class PasswordLowercaseCriteriaTests: XCTestCase {
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("a"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
}

// MARK: - DigitCriteria
class PasswordDigitCriteriaTests: XCTestCase {
    func testdigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testdigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
}

// MARK: - SpecialCharacterCriteria
class PasswordSpecialCharacterCriteriaTests: XCTestCase {
    func testspecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("@"))
    }
    
    func testspecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("&"))
    }
}
