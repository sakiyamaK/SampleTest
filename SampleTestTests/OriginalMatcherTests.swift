//
//  OriginalMatcherTests.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/23.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

func beTeen() -> Predicate<Person> {
  //expectで渡された式がactualExpressionに代入される
  return Predicate { (actualExpression: Expression<Person>) throws -> PredicateResult in
    //エラーメッセージ
    let msg = ExpectationMessage.expectedActualValueTo("be teenager")
    //actualExpressionを評価して値を取り出す
    if let actualValue = try actualExpression.evaluate() {
      //評価結果
      return PredicateResult(
        bool: (13...19).contains(actualValue.age),
        message: msg
      )
    } else {
      //値が取り出せなかった場合(nilとか)
      return PredicateResult(
        status: .fail,
        message: msg.appendedBeNilHint()
      )
    }
  }
}

//ヘルパー関数を使った場合
func beTeen2() -> Predicate<Person> {
  return Predicate.simple("be teenager") { (actualExpression) -> PredicateStatus in
    if let actual = try actualExpression.evaluate() {
      return PredicateStatus(bool: (13...19).contains(actual.age))
    }
    return .fail
  }
}

class OriginalMatcherTests: QuickSpec {

  override func spec() {
    let person = Person(name: "山田", age: 29)

    let persons = [
      Person(name: "高橋", age: 14),
      Person(name: "細沼", age: 19)
    ]

    describe("teenager") {
      context("beTeen") {

        it("山田") {
          expect(person).to(beTeen())
        }
        it("nil") {
          expect(nil).to(beTeen())
        }

        it("persons") {
          expect(persons).to(allPass(beTeen()))
        }
      }

      context("beTeen2") {
        it("persons") {
          expect(persons).to(allPass(beTeen2()))
        }
      }
    }
  }
}
