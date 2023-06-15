//
//  StartupModule.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import Foundation

final class StartupModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: StartupCoordinator
    
    init() {
        coordinator = StartupCoordinator()
    }
    
}
