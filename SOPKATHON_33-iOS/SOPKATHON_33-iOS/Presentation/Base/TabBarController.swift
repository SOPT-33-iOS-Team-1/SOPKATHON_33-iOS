//
//  TabBarController.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/25/23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let tabNavigationController = UINavigationController()
    var tabBarArray = [UINavigationController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTabBar()
        view.backgroundColor = .white
    }
    
    private func setUI() {
        tabBar.backgroundColor = .brown
    }
    
    private func setTabBar() {
        let firstVc = UIViewController()
        let secondVc = UIViewController()
        
        firstVc.tabBarItem = UITabBarItem(title: "tab1" , image: .checkmark, tag: 0)
        secondVc.tabBarItem = UITabBarItem(title: "tab2", image: .add, tag: 1)
        
        self.viewControllers = [firstVc, secondVc]
        setViewControllers(viewControllers, animated: true)
    }
    
}
