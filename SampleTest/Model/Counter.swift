//
//  Counter.swift
//  SampleTest
//
//  Created by sakiyamaK on 2021/01/18.
//

import Foundation

struct Counter: Decodable {
  var count: Int = 0
  var isLowerLimit: Bool { count == 0 }
  var isUpperLimit: Bool { count >= 10 }
  mutating func increment() {
    self.count += 1
  }
  mutating func decrement() {
    self.count += 1
  }
}
