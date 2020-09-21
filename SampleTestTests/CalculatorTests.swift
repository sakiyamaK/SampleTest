//
//  CalculatorTests.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import XCTest
@testable import SampleTest

class CalculatorTests: XCTestCase {
  func testAdd() {
    let mockLogger = MockLogger()
    let calculator = Calculator(logger: mockLogger)
    let expectedSendMessages = [
      "Start calc.",
      "Add 1",
      "Total is 1",
      "Finish calc."
    ]

    calculator.add(num: 1)

    XCTAssertEqual(calculator.calc(), 1)
    XCTAssertTrue(mockLogger.invokedSendLog)
    XCTAssertEqual(mockLogger.invokedSendLogCount, 4)
    XCTAssertEqual(mockLogger.sendLogProperties, expectedSendMessages)
  }
}
