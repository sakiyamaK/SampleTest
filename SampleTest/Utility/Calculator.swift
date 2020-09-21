//
//  Calculator.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

protocol LoggerProtocol {
  func sendLog(message: String)
}

class Logger: LoggerProtocol {
  func sendLog(message: String) {
    //本番用のログ送信の実装
  }
}

class DebugLogger: LoggerProtocol {
  func sendLog(message: String) {
    //デバッグ用のログ送信の実装
  }
}

class MockLogger: LoggerProtocol {
  var invokedSendLog = false
  var invokedSendLogCount = 0
  var sendLogProperties: [String] = []

  func sendLog(message: String) {
    invokedSendLog = true
    invokedSendLogCount += 1
    sendLogProperties.append(message)
  }
}

class Calculator {
  private let logger: LoggerProtocol
  init(logger: LoggerProtocol) {
    self.logger = logger
  }

  private enum CalcAction {
    case add(Int)
    //いずれ引き算、割り算なども追加されていくはず
  }

  private var calcActions: [CalcAction] = []

  func add(num: Int) {
    calcActions.append(.add(num))
  }

  func calc() -> Int {
    logger.sendLog(message: "Start calc.")
    var total = 0
    calcActions.forEach {
      switch $0 {
      case .add(let num):
        logger.sendLog(message: "Add \(num)")
        total += num
      }
    }
    logger.sendLog(message: "Total is \(total)")
    logger.sendLog(message: "Finish calc.")
    return total
  }

}
