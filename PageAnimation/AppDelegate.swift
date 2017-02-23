//
//  AppDelegate.swift
//  PageAnimation
//
//  Created by Lucas Twisk on 23-02-17.
//  Copyright © 2017 Lucas Twisk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window!.rootViewController = PageViewController()
		self.window!.makeKeyAndVisible()
		
		return true
	}
}

