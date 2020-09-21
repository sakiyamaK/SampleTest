//
//  UserManager.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

class UserManager {
  static let shared = UserManager()
  private init() {}

  private(set) var user: User?

  func fetchUser(completion: (() -> Void)? = nil) {
    let  apiManager = APIManager()
    apiManager.fetchUser { [weak self] (result) in
      switch result {
      case .success(let user):
        self?.user = user
      case .failure(let error):
        DLog(error.localizedDescription)
      }
      completion?()
    }
  }
}
