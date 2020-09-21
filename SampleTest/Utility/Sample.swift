//
//  Macro.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/05.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

struct Sample {
  static func validate(password: String) -> Bool {
    return password.count > 7 && password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined().count >= 2
  }

  static func divide(_ v1: Int, by: Int) -> Int {
    v1/by
  }
}
