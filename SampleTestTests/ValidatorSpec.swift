//
//  ValidatorSpec.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

final class ValidatorSpec: QuickSpec {
  override func spec() {
    //Qickによるテストの構造化
    describe("ValidatePassword関数") {
      context("8文字未満") {
        it("falseを返す") {
          //Nimbleによるアサーション
          expect(Sample.validate(password: "1234567")).to(beFalse())
        }
      }
      context("8文字以上") {
        context("含まれる数が2文字未満") {
          it("falseを返す") {
            expect(Sample.validate(password: "abcdefgh1")).to(beFalse())
          }
        }
        context("含まれる数が2文字以上") {
          it("trueを返す") {
            expect(Sample.validate(password: "abcdef12")).to(beTrue())
          }
        }
      }
    }

//    xdescribe("xをつけて実行しないようにする") {
    //fがあると実行する
//    fcontext("実行する") {
//      it("falseを返す") {
//        expect("".isEmpty).to(beTrue())
//      }
//    }
//    //これも実行しない
//    xcontext("実行しない") {
//      it("falseを返す") {
//        expect("".isEmpty).to(beFalse())
//      }
//    }
//    }
  }
}

