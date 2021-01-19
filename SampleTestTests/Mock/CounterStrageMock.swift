//
//  CounterStorageMock.swift
//  SampleTestTests
//
//  Created by sakiyamaK on 2020/09/26.
//

@testable import SampleTest

protocol CounterStorageProtocol {
  func save(_ count: Int)
}


class CounterStorageMock: CounterStorageProtocol {
  var latestSaveCount: Int?
  func save(_ count: Int) {
    self.latestSaveCount = count
    DLog("\(self.latestSaveCount) \(count)")
  }
}
