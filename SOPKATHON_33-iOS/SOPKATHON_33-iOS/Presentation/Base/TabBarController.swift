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
        view.tintColor = .white
    }
    
    private func setUI() {
        tabBar.backgroundColor = UIColor(red: 0.106, green: 0.114, blue: 0.122, alpha: 1)
    }
    
    private func setTabBar() {
        let firstVc = MainViewController()
        let secondVc = ProgramViewController()
        
        firstVc.tabBarItem = UITabBarItem(title: nil, image: Image.tabBarItem1Unselected, selectedImage: Image.tabBarItem1Selected)
        
        secondVc.tabBarItem = UITabBarItem(title: nil, image: Image.tabBarItem2Unselected, selectedImage: Image.tabBarItem2Selected)

        self.viewControllers = [firstVc, secondVc]
        setViewControllers(viewControllers, animated: true)
    }
    
}
