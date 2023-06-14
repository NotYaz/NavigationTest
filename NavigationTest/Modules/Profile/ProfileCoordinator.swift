//
//  ProfileCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileCoordinator: CoordinatorProtocol {
    
    var hostVC: ProfileNavigationVC
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = ProfileNavigationVC()
        
        nodes = [ProfileNode(coordinator: self)]
        set(nodes: nodes)
    }
}
