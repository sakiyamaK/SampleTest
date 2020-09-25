//
//  AsyncTests.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/22.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

//非同期処理のテストの書き方
func asyncEcho(_ message: String, deadline: DispatchTime = .now() + 0.5,  _ completion:((String) -> Void)? = nil) {
  DispatchQueue.main.asyncAfter(deadline: deadline) {
    completion?("\(message)")
  }
}

class AsyncTests: QuickSpec {
  override func spec() {

    describe("Async Tests") {
      context("timeout") {
        it("no timeout time") {
          waitUntil { (done) in
            asyncEcho("Hello") { message in
              expect(message) == "Hello"
              done()
            }
          }
        }

        it("5sec") {
          waitUntil(timeout: 2) { (done) in
            asyncEcho("Hello", deadline: .now() + 1) { message in
              expect(message) == "Hello"
              done()
            }
          }
        }

        it("eventually") {
          var actual = ""
          asyncEcho("Hello", deadline: .now() + 1) { message in
            actual = message
          }
          //actualがequal("Hello")を満たすかtimeout時間まで計測してタイムアウトするまで待機する
          //pollIntervalの間隔で満たすかチェックする
          expect(actual).toEventually(equal("Hello"), timeout: 2, pollInterval: 0.2)
        }
      }
    }
  }
}
