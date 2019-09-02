//
//  AppDelegate.swift
//  Viper
//
//  Created by Victor Alejandria on 30/08/2019.
//  Copyright © 2019 Victor Alejandria. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let initialController = NavigationController()
		initialController.setRootWireframe(UsersWireframe())

		self.window = UIWindow(frame: UIScreen.main.bounds)

		self.window?.rootViewController = initialController
		self.window?.makeKeyAndVisible()

		return true
	}

}

