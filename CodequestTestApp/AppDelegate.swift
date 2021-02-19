//
//  AppDelegate.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var mainFlowController: MainFlowController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = UINavigationController()
        mainFlowController = MainFlowController(rootViewController: rootViewController)
        mainFlowController.startFlow()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }


}

