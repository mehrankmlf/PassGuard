//
//  AppDelegate.swift
//  Example
//
//  Created by Mehran Kamalifard on 7/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle
    func setRootViewController() {
        
        // Create the root view controller as needed
        let vc = LoginViewController()
        let nc = UINavigationController(rootViewController: vc)

        // Create the window. Be sure to use this initializer and not the frame one.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window!.rootViewController = nc
        window!.makeKeyAndVisible()

//        window = UIWindow.init(frame: UIScreen.main.bounds)
//        window?.rootViewController = LoginViewController()
//        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

