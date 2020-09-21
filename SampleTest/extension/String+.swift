//
//  String+.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

extension String {
  func isOnlyNumeric() -> Bool {
    self.trimmingCharacters(in: .decimalDigits).count <= 0
  }
}
