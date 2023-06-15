//
//  StartupCoordinator.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import Foundation
import UIKit

final class StartupCoordinator: CoordinatorProtocol {
    
    var hostVC: UINavigationController
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = UINavigationController()
        hostVC.isNavigationBarHidden = true
        
        nodes = [SplashNode(coordinator: self)]
        set(nodes: nodes)
    }
    
}

extension StartupCoordinator {
    
    func showProfileSelection() {
        let profileSelectionNode = ProfileSelectionNode(coordinator: self)
        nodes += [profileSelectionNode]
        show(node: profileSelectionNode)
    }
    
    func showProfileLoading() {
        // TODO: - ProfileLoading Screen
    }
}
