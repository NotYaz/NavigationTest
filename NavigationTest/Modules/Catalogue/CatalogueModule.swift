//
//  CatalogueModule.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class CatalogueModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: CatalogueCoordinator
    
    init() {
        coordinator = CatalogueCoordinator()
    }
}
