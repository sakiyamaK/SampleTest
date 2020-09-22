//
//  NimbleTests.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/22.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

class NimbleTests: QuickSpec {
  override func spec() {

    describe("Nimble Tests") {
      context("マッチャー") {

        it("1") {
          expect(1+1).to(equal(2))
          expect(1+1) == 2
          expect(1+1).toNot(equal(3))
          expect(1+1) != 3
        }

        it("2") {
          //1.1の±0.1の範囲内か
          expect(1.2).to(beCloseTo(1.1, within: 0.1))
          expect(1.2) == 1.1 ± 0.01
        }

        it("3") {
          expect("Hello, World!").to(contain("World"))
        }

        it("4") {
          expect(["Apple", "Orange"]).toNot(contain("Banna"))
        }

        it("5") {
          expect(3).to(beGreaterThan(2))
          expect(3) > 2
        }

        it("6") {
          let u1 = User(name: "1")
          let u2 = u1
          let u3 = User(name: "3")

          //インスタンスが等しいか検証
          expect(u1).to(beIdenticalTo(u2))
          expect(u1) === u2

          //インスタンスが等しくないか検証
          expect(u1).to(beIdenticalTo(u3))
          expect(u1) !== u3
        }

        it("7") {
          //5 < 10
          expect(5).to(beLessThan(10))
          expect(5) < 10

          //5 <= 10
          expect(5).to(beLessThanOrEqualTo(10))
          expect(5) <= 10

          //5 > 10
          expect(5).to(beGreaterThan(10))
          expect(5) > 10

          //5 >= 10
          expect(5).to(beGreaterThanOrEqualTo(10))
          expect(5) >= 10
        }
      }

      context("失敗例") {
        it("1") {
          expect(1+1).to(equal(3), description: "1+1=2になれ")
        }
      }

      context("マッチャーの組み合わせ") {
        it("1") {
          //helloで始まり, worldで終わる
          expect("Hello, world").to(satisfyAllOf(beginWith("Hello"), endWith("world")))
          expect("Hello, world").to(beginWith("Hello") && endWith("world"))
        }

        it("2") {
          //2か7か11
          expect(7).to(satisfyAnyOf(equal(2), equal(7), equal(11)))
          expect(7).to(equal(2) || equal(7) || equal(11))
        }
      }

      context("オリジナルバリデーション") {
        it("1") {
          //郵便番号
          let str = "123-4567"

          expect({
            let pattern = "^\\d{3}-\\d{4}$"
            let regex = try! NSRegularExpression(pattern: pattern, options: [])
            let matches = regex.matches(in: str, options: [], range: NSMakeRange(0, str.count))

            if matches.count > 0 { return .succeeded }
            else { return .failed(reason: "郵便番号の形じゃない") }
          }).to(succeed())
        }
      }
    }
  }
}
