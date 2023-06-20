//
//  MovieCardNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 20.06.2023.
//

import Foundation

final class MovieCardNode: NodeProtocol {
    
    var presenter: MovieCardPresenter
    var interactor: MovieCardInteractor
    var view: MovieCardView
    
    weak var coordinator: HomeCoordinator?
    
    var showStyle: ShowStyle {
        .modal
    }
    
    init(coordinator: HomeCoordinator) {
        presenter = MovieCardPresenter()
        interactor = MovieCardInteractor(presenter: presenter, coordinator: coordinator)
        view = MovieCardView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
}
