//
//  HomeModule.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeModule: ModuleProtocol {
    
    var submodules: [any ModuleProtocol] = []
    
    var coordinator: HomeCoordinator
    
    init() {
        coordinator = HomeCoordinator()
    }
    
}
