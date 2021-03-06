//
//  AppDelegate.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    let vc = CounterViewController()
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    return true
  }
}

