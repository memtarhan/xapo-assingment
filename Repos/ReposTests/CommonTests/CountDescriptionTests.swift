//
//  CountDescriptionTests.swift
//  ReposTests
//
//  Created by Mehmet Tarhan on 05/05/2023.
//

import XCTest
@testable import Repos

final class CountDescriptionTests: XCTestCase {

    func testThousandCoundDescription() {
        let expectedValue = "1.5k"
        let value = 1458.asCountDescription
        XCTAssertEqual(expectedValue, value)
        
        let expectedValue2 = "563.9k"
        let value2 = 563900.asCountDescription
        XCTAssertEqual(expectedValue2, value2)
    }

}
