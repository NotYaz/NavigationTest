//
//  CatalogueCoordinator.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation
import UIKit

final class CatalogueCoordinator: CoordinatorProtocol {
    
    var hostVC: CatalogueNavigationVC
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = CatalogueNavigationVC()
        
        nodes = [CatalogueNode(coordinator: self)]
        set(nodes: nodes)
    }
}
