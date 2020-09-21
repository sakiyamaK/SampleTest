//
//  APIManager.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

class APIManager {
  func fetchUser(completion: ((Result<User, Error>) -> Void)? = nil) {
    let url = URL(string: "https://tanaka.com/user")!
    let request = URLRequest(url: url)
    let session = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
      if let _error = error {
        completion?(.failure(_error))
        return
      }
      guard let _data = data else {
        let error = NSError.init(domain: "no data", code: 100, userInfo: nil)
        completion?(.failure(error))
        return
      }

      let decoder = JSONDecoder()
      do {
        let user = try decoder.decode(User.self, from: _data)
        completion?(.success(user))
      } catch {
        completion?(.failure(error))
      }
    })
    session.resume()
  }
}
