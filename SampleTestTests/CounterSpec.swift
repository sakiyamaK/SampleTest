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

//DIでMockを使ったテスト
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

      describe("#isLowerLimt") {
        context("現在値が0") {
          it("trueになる") {
            expect(Counter(count: 0).isLowerLimit) == true
          }
        }
        context("現在値が1以上") {
          it("falseになる") {
            expect(Counter(count: 1).isLowerLimit) == false
          }
        }
      }

      describe("#isLowerLimt") {
        context("現在値が10") {
          it("trueになる") {
            expect(Counter(count: 10).isUpperLimit) == true
          }
        }
        context("現在値が10未満") {
          it("falseになる") {
            expect(Counter(count: 9).isUpperLimit) == false
          }
        }
      }

      describe("永続化") {
        context("現在値が2") {
          var counter: Counter!
          var counterStrageMock: CounterStrageMock!

          beforeEach {
            DLog("----- beforeEach -----")
            counterStrageMock = CounterStrageMock()
            counter = Counter(count: 2, counterStrageProtocol: counterStrageMock)
          }

          context("#increment") {
            it("CounterStrageProtocol.save()が引数3で呼び出されること") {
              counter.increment()
              expect(counterStrageMock.latestSaveCount) == 3
            }
          }

          context("#decrement") {
            it("CounterStrageProtocol.save()が引数1で呼び出されること") {
              counter.decrement()
              expect(counterStrageMock.latestSaveCount) == 1
            }
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

