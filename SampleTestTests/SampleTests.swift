//
//  SampleTestTests3.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/05.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

//Sample.swiftの中身をテストしている

import XCTest
@testable import SampleTest

class PasswordValidatorTests: XCTestCase {
  override class func setUp() {
    DLog()
    super.setUp()
  }

  override func setUp() {
    DLog()
    super.setUp()
  }

  override func tearDown() {
    DLog()
    super.tearDown()
  }

  override class func tearDown() {
    DLog()
    super.tearDown()
  }

  //  //8文字以上であること
  //  func test数字が２文字以上含まれており_合計7文字入力された場合にfalseが返されること() {
  //    XCTAssertFalse(Sample.validate(password: "abcde12"))
  //  }
  //
  //  func test数字が２文字以上含まれており_合計8文字入力された場合にtrueが返されること() {
  //    XCTAssertTrue(Sample.validate(password: "abcdef12"))
  //  }
  //
  //  func test数字が２文字以上含まれており_合計9文字入力された場合にtrueが返されること() {
  //    XCTAssertTrue(Sample.validate(password: "abcdefg12"))
  //  }
  //
  //  //数字が2文字以上であること
  //  func test数字以外を7文字と_数字が1文字入力された場合にfalseが返されること() {
  //    XCTAssertFalse(Sample.validate(password: "abcdefg1"))
  //  }
  //
  //  func test数字以外を7文字と_数字が2文字入力された場合にtrueが返されること() {
  //    XCTAssertTrue(Sample.validate(password: "abcdefg12"))
  //  }
  //
  func test数字以外を7文字と_数字が3文字入力された場合にtrueが返されること() {
    DLog()
    XCTAssertTrue(Sample.validate(password: "abcdefg123"))
  }
  func testパスワードバリデーションの文字数() {
    DLog()
    XCTContext.runActivity(named: "数字が２文字以上含まれている場合") { _ in
      XCTContext.runActivity(named: "合計7文字が入力された場合") { _ in
        XCTAssertFalse(Sample.validate(password: "abcde12"))
      }

      XCTContext.runActivity(named: "合計8文字が入力された場合") { _ in
        XCTAssertTrue(Sample.validate(password: "abcdef12"))
      }

      XCTContext.runActivity(named: "合計9文字が入力された場合") { _ in
        XCTAssertTrue(Sample.validate(password: "abcdefg12"))
      }
    }

    addTeardownBlock {
      print("\(#line) \(#function)")
    }
  }
}


class NumericStringTests: XCTestCase {
  func assertOnlyNumeric(string: String, file: String = #file, line: UInt = #line) {
    XCTAssertTrue(string.isOnlyNumeric(), "\(file) \(line), [\(string)] not only numeric")
  }

  func testIsOnlyNumericsString() {
    //わざと失敗するパターン
//    assertOnlyNumeric(string: "numericStr")
    assertOnlyNumeric(string: "12345")
  }

  func testDivide() {
    XCTAssertEqual(Sample.divide(4, by: 3), 1, "4/3 = 1だろ")
  }
}

class AsyncTest: XCTestCase {
  func testAsyncString() {
    let exp = XCTestExpectation(description: "Async String")
    asyncString(sleepInt: 3) { string in
      //3秒以内に取得したstringが"文字列A"ならTrueということになる
      XCTAssertEqual(string, "文字列A")
      exp.fulfill()
    }

    //指定した秒数以内にexp.fulfill()が呼ばれないようならエラー
    wait(for: [exp], timeout: 5.0)
  }
}

class ExceptionTest: XCTestCase {
  func testDvidWhenDivisionZero() {
    XCTAssertThrowsError(try divide(3, by:0)) { error in
      let _error = error as? OperationError
      XCTAssertEqual(_error, OperationError.divisionByZero)
    }
  }
}
