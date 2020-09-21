//
//  Utils.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

func DLog(_ message: String = "", _ line: Int = #line, _ function: String = #function) {
  print("----- \(line) \(function) : \(message)-----")
}

func asyncString(sleepInt: UInt32 = 3, completion: ((String)-> Void)? = nil) {
  DispatchQueue.global().async {
    sleep(sleepInt)
    completion?("文字列A")
  }
}

enum OperationError: Error {
  case divisionByZero
}

func divide(_ x: Int, by y: Int) throws -> Int {
  if y == 0 {
    throw OperationError.divisionByZero
  }
  return x/y
}
