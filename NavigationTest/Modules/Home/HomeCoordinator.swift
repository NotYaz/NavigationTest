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
    
    func showGenres() {
        let genresNode = GenresNode(coordinator: self)
        nodes += [genresNode]
        show(node: genresNode)
    }
    
    func showMovieCard() {
        let movieCardNode = MovieCardNode(coordinator: self)
        nodes += [movieCardNode]
        show(node: movieCardNode)
    }
    
    func showProfile() {
        let profileNode = ProfileNode(coordinator: ProfileCoordinator())
        nodes += [profileNode]
        show(node: profileNode)
    }
    
    func goBack() {
        nodes.removeLast()
        pop()
    }
    
}
