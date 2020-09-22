//
//  CounterSpec.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/22.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

class CounterSpec: QuickSpec {
  override func spec() {
    beforeSuite {
      DLog("----- beforeSuite -----")
    }

    describe("Counter") {
      //テス用の変数
      var counter: Counter!

      //この階層に定義されたitの直前に呼ばれる
      beforeEach {
        DLog("----- beforeEach -----")
        counter = Counter()
      }

      it("初期値は0であること") {
        expect(counter.count).to(equal(0))
//        XCTAssertEqual(counter.count, 0)
      }

      describe("#increment") {
        context("1回だけ呼び出し") {
          it("countが1になること") {
            counter.increment()
            expect(counter.count).to(equal(1))
          }
        }

        let countCount = 2
        context("\(countCount)回だけ呼び出し") {
          it("countが\(countCount)になること") {
            for _ in 1...countCount {
              counter.increment()
            }
            expect(counter.count).to(equal(countCount))
          }
        }
      }

      //この階層に定義されたitの直後に呼ばれる
      //今回の場合はbeforeEachで初期化してるから本来はやる必要はない
      afterEach {
        DLog("----- afterEach -----")
        counter.reset()
      }
    }

    afterSuite {
      DLog("----- afterSuite -----")
    }
  }
}
