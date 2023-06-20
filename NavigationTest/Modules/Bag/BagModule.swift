//
//  BagModule.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class BagModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: BagCoordinator
    
    init() {
        coordinator = BagCoordinator()
    }
}
