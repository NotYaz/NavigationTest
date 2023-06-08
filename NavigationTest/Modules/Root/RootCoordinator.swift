//
//  RootCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class RootCoordinator: CoordinatorProtocol {
    
    var hostVC: RootVC
    
    func set(viewControllers: [UIViewController]) {
//        hostVC.setViewControllers(viewControllers, animated: false)
        hostVC.viewControllers = viewControllers
    }
    
    func set(nodes: [any NodeProtocol]) {
//        hostVC.setViewControllers([], animated: false)
    }
    
    func show(node: any NodeProtocol) {
//
    }
    
    init() {
        self.hostVC = RootVC()
    }
}
