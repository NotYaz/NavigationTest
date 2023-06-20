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
        let profileLoadingnNode = ProfileLoadingNode(coordinator: self)
        nodes += [profileLoadingnNode]
        show(node: profileLoadingnNode)
    }
    
    func showMainTabs() {
        let tabsModule = TabbarModule()
        guard let window = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow }).last else { return }
        window.rootViewController = tabsModule.coordinator.hostVC
        UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil)
    }
}
