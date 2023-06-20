//
//  TabbarModule.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class TabbarModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: TabbarCoordinator
    
    init() {
        coordinator = TabbarCoordinator()

        let homeModule = HomeModule()
        let catalogueModule = CatalogueModule()
        let bagModule = BagModule()
        submodules = [homeModule, catalogueModule, bagModule]
        
        coordinator.set(viewControllers: [homeModule.coordinator.hostVC,
                                          catalogueModule.coordinator.hostVC,
                                          bagModule.coordinator.hostVC])
    }
    
}
