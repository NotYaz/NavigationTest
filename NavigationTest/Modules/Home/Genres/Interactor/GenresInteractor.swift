//
//  GenresInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation

final class GenresInteractor: InteractorProtocol {

    weak var presenter: GenresPresenter?
    weak var coordinator: HomeCoordinator?

    init(presenter: GenresPresenter, coordinator: HomeCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func goBack() {
        coordinator?.goBack()
    }
}
