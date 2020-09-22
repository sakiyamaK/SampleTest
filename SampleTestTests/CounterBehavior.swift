//
//  CounterBehavior.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/22.
//

import XCTest
import Quick
import Nimble
@testable import SampleTest

class CounterBehavior: Behavior<Int> {
  override static func spec(_ aContext: @escaping () -> Int) {
    var counter: Counter!
    var initial: Int!

    beforeEach {
      initial = aContext()
      counter = Counter(count: initial)
      counter.increment()
      counter.increment()
    }

    it("incrementを2回呼び出したら現在の値+2されること") {
      expect(counter.count).to(equal(initial+2))
    }
  }
}

class CounterBehaviorSpec: QuickSpec {
  override func spec() {
    describe("Counter") {
      itBehavesLike(CounterBehavior.self) { 0 }
      itBehavesLike(CounterBehavior.self) { 1 }
    }
  }
}
