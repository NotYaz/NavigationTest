//
//  BagCoordinator.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation

final class BagCoordinator: CoordinatorProtocol {
    
    var hostVC: BagNavigationVC
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = BagNavigationVC()
        
        nodes = [BagNode(coordinator: self)]
        set(nodes: nodes)
    }
    
    func showProfile() {
        let profileNode = ProfileNode(coordinator: ProfileCoordinator())
        nodes += [profileNode]
        show(node: profileNode)
    }
}
