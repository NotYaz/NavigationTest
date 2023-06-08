//
//  RootCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class RootCoordinator: CoordinatorProtocol {
    
    var hostVC: RootVC
    var nodes: [any NodeProtocol] = []
    
    func set(viewControllers: [UIViewController]) {
        hostVC.viewControllers = viewControllers
    }
    
    func set(nodes: [any NodeProtocol]) {

    }
    
    func show(node: any NodeProtocol) {
        
    }
    
    init() {
        hostVC = RootVC()
    }
}
