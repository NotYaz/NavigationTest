//
//  HomeListInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeListInteractor: InteractorProtocol {
    
    weak var presenter: HomeListPresenter?
    weak var coordinator: HomeCoordinator?
    
    init(presenter: HomeListPresenter, coordinator: HomeCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func didSelectItem(index: Int) {
        coordinator?.showDetail(index: index)
    }
    
}
