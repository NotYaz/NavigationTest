//
//  HomeCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeCoordinator: CoordinatorProtocol {
    
    var hostVC: HomeNVC
    
    func set(nodes: [any NodeProtocol]) {
        hostVC.setViewControllers(nodes.map { $0.view }, animated: false)
    }
    
    func show(node: any NodeProtocol) {
        switch node.showStyle {
        case .push:
            hostVC.pushViewController(node.view, animated: true)
        case .modal:
            hostVC.present(node.view, animated: true)
        default:
            fatalError("showStyle not supported")
        }
    }
    
    init() {
        hostVC = HomeNVC()
    }
    
    
}
