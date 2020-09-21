//
//  DialogmanagerTest.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import XCTest
@testable import SampleTest

class DialogManagerTests: XCTestCase {
  func testShowLoginDialog_ログイン済み() {
    let stubAuthManager = StubAuthManager()
    stubAuthManager.isLoggedIn = true
    let dialogManager = DialogManager(authManager: stubAuthManager)

    XCTAssertFalse(dialogManager.shouldShowLoginDialog)
  }

  func testShowLoginDialog_未ログイン() {
    let stubAuthManager = StubAuthManager()
    stubAuthManager.isLoggedIn = false
    let dialogManager = DialogManager(authManager: stubAuthManager)

    XCTAssertTrue(dialogManager.shouldShowLoginDialog)
  }
}
