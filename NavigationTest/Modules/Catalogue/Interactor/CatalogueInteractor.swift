//
//  CatalogueInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class CatalogueInteractor: InteractorProtocol {
    
    weak var presenter: CataloguePresenter?
    weak var coordinator: CatalogueCoordinator?
    
    init(presenter: CataloguePresenter, coordinator: CatalogueCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
}
