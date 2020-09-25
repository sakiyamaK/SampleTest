//
//  UserManagerTests.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import XCTest
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import SampleTest

//HTTP通信のテスト
class UserManagerTests: XCTestCase {
  private var userManager: UserManager!

  override func setUp() {
    super.setUp()
    userManager = UserManager.shared
  }

  override func tearDown() {
    userManager = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }

  func testFetchuser() {
    let exp = expectation(description: #function)

    stub(condition: isHost("tanaka.com")) { (url) -> HTTPStubsResponse in
      let _url = Bundle(for: UserManagerTests.self)
        .url(forResource: "User", withExtension: "json")!
      let data = try! Data(contentsOf: _url)
      return HTTPStubsResponse(data: data, statusCode: 200, headers: nil)
    }

    userManager.fetchUser { [weak self] in
      XCTAssertNotNil(self?.userManager.user)
      XCTAssertEqual(self?.userManager.user?.name, "Danbo-Tanaka")
      exp.fulfill()
    }

    wait(for: [exp], timeout: 3.0)
  }
}
