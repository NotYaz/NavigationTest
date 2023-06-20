//
//  GenresNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation

final class GenresNode: NodeProtocol {

    var presenter: GenresPresenter
    var interactor: GenresInteractor
    var view: GenresView
    
    weak var coordinator: HomeCoordinator?
    
    var showStyle: ShowStyle { .push }
    
    init(coordinator: HomeCoordinator) {
        presenter = GenresPresenter()
        interactor = GenresInteractor(presenter: presenter, coordinator: coordinator)
        view = GenresView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
