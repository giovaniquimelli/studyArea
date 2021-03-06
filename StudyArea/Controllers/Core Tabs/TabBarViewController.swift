//
//  TabBarViewController.swift
//  StudyArea
//
//  Created by Gio on 01/02/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.barTintColor = .systemGray6
        
        setUpControllers()
    }
    
    private func setUpControllers() {
//        guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else {
//            AuthManager.shared.signOut { _ in
//                // do nothing
//            }
//            return
//        }
        
        let home = HomeViewController()
        home.title = "Study Area"
        let profile = ProfileViewController(currentEmail: "currentUserEmail")
        profile.title = "Profile"
        
        home.navigationItem.largeTitleDisplayMode = .always
        profile.navigationItem.largeTitleDisplayMode = .always

        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: profile)

        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true

        nav1.tabBarItem = UITabBarItem(title: "Study Area", image: UIImage(systemName: "bubble.left.and.bubble.right"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)

        setViewControllers([nav1, nav2], animated: true)
    }
}
