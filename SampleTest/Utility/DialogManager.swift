//
//  DialogManager.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

//実際のAuthManager(今回は用意してない)と、テストで使うStubAuthManagerを切り替えられるようにprotocolで宣言する
protocol AuthManagerProtocol {
  var isLoggedIn: Bool { get }
}

//テストで使うManager
class StubAuthManager: AuthManagerProtocol {
  var isLoggedIn: Bool = false
}

//外部から注入されたManagerに応じて動きが変わる(DI)
class DialogManager {
  private let authManager: AuthManagerProtocol

  init(authManager: AuthManagerProtocol) {
    self.authManager = authManager
  }

  var shouldShowLoginDialog: Bool { !authManager.isLoggedIn }
}
