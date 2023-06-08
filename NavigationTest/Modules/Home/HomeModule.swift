//
//  HomeModule.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    var nodes: [any NodeProtocol] = []
    
    var coordinator: HomeCoordinator
    
    init() {
        coordinator = HomeCoordinator()
        nodes = [HomeListNode()]
        
        coordinator.set(nodes: nodes)
    }
    
}
