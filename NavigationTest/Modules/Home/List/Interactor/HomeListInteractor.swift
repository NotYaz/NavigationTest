//
//  HomeListInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeListInteractor: InteractorProtocol {
    
    weak var presenter: HomeListPresenter?
    var coordinator: HomeCoordinator?
    
    init(presenter: HomeListPresenter, coordinator: HomeCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        if indexPath.section % 2 != .zero {
            coordinator?.showGenres()
        } else {
            coordinator?.showMovieCard()
        }
    }
    
}
