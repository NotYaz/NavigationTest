//
//  TabbarCoordinator.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import UIKit

final class TabbarCoordinator: CoordinatorProtocol {
    
    var hostVC: TabbarVC
    
    var nodes: [any NodeProtocol] = []
    
    func set(viewControllers: [UIViewController]) {
        let tabs = viewControllers.map { makeTab($0 as! NavigationController) }
        hostVC.viewControllers = tabs
    }
    
    private func makeTab(_ vc: NavigationController) -> UINavigationController {
        let item = UITabBarItem(title: vc.name, image: nil, tag: .zero)
        vc.tabBarItem = item
        return vc
    }
    
    func set(nodes: [any NodeProtocol]) {
        
    }
    
    func show(node: any NodeProtocol) {
        
    }
    
    init() {
        hostVC = TabbarVC()
    }
}

final class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    private func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBarAppearance.backgroundColor = .black
        
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 9.0, weight: .medium),
            .foregroundColor: UIColor.white.withAlphaComponent(0.5)
        ]
        
        let titleSelectedTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 9.0, weight: .medium),
            .foregroundColor: UIColor.white
        ]
        
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = titleTextAttributes
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = titleSelectedTextAttributes
        
        tabBar.standardAppearance = tabBarAppearance
        
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
    }
}
