//
//  HomeDetailNode.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeDetailNode: NodeProtocol {

    var presenter: HomeDetailPresenter
    var intercator: HomeDetailInteractor
    var view: HomeDetailView
    
    weak var coordinator: HomeCoordinator?
    
    var showStyle: ShowStyle {
        .push
    }
    
    init(coordinator: HomeCoordinator) {
        presenter = HomeDetailPresenter()
        intercator = HomeDetailInteractor(presenter: presenter, coordinator: coordinator)
        view = HomeDetailView(interactor: intercator)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
    convenience init(index: Int, coordinator: HomeCoordinator) {
        self.init(coordinator: coordinator)
        
        intercator.index = index
    }
    
}
