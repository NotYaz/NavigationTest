//
//  HomeCoordinator.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeCoordinator: CoordinatorProtocol {
    
    var hostVC: HomeNavgationVC
    var nodes: [any NodeProtocol] = []
    
    init() {
        hostVC = HomeNavgationVC()
        
        nodes = [HomeListNode(coordinator: self)]
        set(nodes: nodes)
    }

}

extension HomeCoordinator {
    
    func showDetail(index: Int) {
        let detailNode = HomeDetailNode(index: index, coordinator: self)
        nodes += [detailNode]
        show(node: detailNode)
    }
    
}
