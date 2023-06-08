//
//  RootModule.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class RootModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: RootCoordinator
    
    init() {
        coordinator = RootCoordinator()
        
        let homeModule = HomeModule()
        let profileModule = ProfileModule()
        
        submodules = [homeModule, profileModule]
        
        coordinator.set(viewControllers: [homeModule.coordinator.hostVC, profileModule.coordinator.hostVC])
    }
    
}
