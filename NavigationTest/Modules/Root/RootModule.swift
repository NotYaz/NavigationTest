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

        let splashModule = StartupModule()
        submodules = [splashModule]
        
        coordinator.set(viewControllers: [splashModule.coordinator.hostVC])
    }
    
}
