//
//  AppDelegate.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 02/06/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    private func setRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let builder = TodosBuilder()
        let root = UINavigationController()
        root.viewControllers = [builder.makeViewController()]
        
        window?.rootViewController = root
    }
}

