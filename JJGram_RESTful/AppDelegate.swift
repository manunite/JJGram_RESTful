//
//  AppDelegate.swift
//  JJGram_RESTful
//
//  Created by heogj123 on 2021/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame:UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let rootViewcontroller = UINavigationController(rootViewController: ViewController())
    rootViewcontroller.isNavigationBarHidden = true
    
    window?.rootViewController = rootViewcontroller
    return true
  }
}

