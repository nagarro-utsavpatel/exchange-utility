//
//  SceneDelegate.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: ApplicationCoordinator!
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let navigationController = UINavigationController()
        coordinator = ApplicationCoordinator(navigationController: navigationController)
        coordinator!.start()
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
    }
}

