//
//  ProfileCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileCoordinator: CoordinatorProtocol {
    
    var hostVC: ProfileNVC
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = ProfileNVC()
        
        nodes = [ProfileNode(coordinator: self)]
        set(nodes: nodes)
    }
}
