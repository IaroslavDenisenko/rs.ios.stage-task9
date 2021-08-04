//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = setupRootVC()
        window?.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    
    private func setupRootVC() -> UIViewController {
        // Setup ItemsCollectionVC
        let itemsVC = ItemsViewController()
        itemsVC.tabBarItem = .init(
            title: "Items",
            image: UIImage(systemName: "rectangle.grid.2x2"),
            tag: 0
        )
        
        // Setup SettingsVC
        let settingsVC = SettingsViewController(style: .insetGrouped)
        let navigationVC = UINavigationController(rootViewController: settingsVC)
        navigationVC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 1
        )
        
        // Setup TabBar
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.viewControllers = [itemsVC, navigationVC]
        return tabBarVC
    }
}

