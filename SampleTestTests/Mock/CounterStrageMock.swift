//
//  CounterStrageMock.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/26.
//

@testable import SampleTest

class CounterStrageMock: CounterStrageProtocol {
  var latestSaveCount: Int?
  func save(_ count: Int) {
    self.latestSaveCount = count
    DLog("\(self.latestSaveCount) \(count)")
  }
}
