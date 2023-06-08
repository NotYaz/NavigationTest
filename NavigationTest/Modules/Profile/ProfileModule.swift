//
//  ProfileModule.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    var nodes: [any NodeProtocol] = []
    
    var coordinator: ProfileCoordinator
    
    init() {
        coordinator = ProfileCoordinator()
        nodes = [ProfileNode()]
        
        coordinator.set(nodes: nodes)
    }
    
}
