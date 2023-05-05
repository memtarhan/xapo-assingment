//
//  DateTests.swift
//  ReposTests
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import XCTest
@testable import Repos

final class DateTests: XCTestCase {

    func testDisplayableDate() {
        let expectedValue = "May 5, 03:49"
        let value = Date(timeIntervalSince1970: 1683298166).displayable
        XCTAssertEqual(expectedValue, value)
    }

    func testQueryDate() {
        let expectedValue = "2023-05-05"
        let value = Date(timeIntervalSince1970: 1683298166).inQueryFormat
        XCTAssertEqual(expectedValue, value)
    }
    
}
