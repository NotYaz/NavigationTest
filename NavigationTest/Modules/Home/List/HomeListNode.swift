//
//  HomeListNode.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeListNode: NodeProtocol {

    var presenter: HomeListPresenter
    var intercator: HomeListInteractor
    var view: HomeListView
    
    weak var coordinator: HomeCoordinator?
    
    var showStyle: ShowStyle {
        .root
    }
    
    init(coordinator: HomeCoordinator) {
        presenter = HomeListPresenter()
        intercator = HomeListInteractor(presenter: presenter, coordinator: coordinator)
        view = HomeListView(interactor: intercator)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
