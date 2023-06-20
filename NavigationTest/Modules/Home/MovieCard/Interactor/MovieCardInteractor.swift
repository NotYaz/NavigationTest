//
//  MovieCardInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 20.06.2023.
//

import Foundation

final class MovieCardInteractor: InteractorProtocol {
    
    weak var presenter: MovieCardPresenter?
    var coordinator: HomeCoordinator?
    
    init(presenter: MovieCardPresenter, coordinator: HomeCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
}
