//
//  HomeDetailInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeDetailInteractor: InteractorProtocol {
    
    weak var presenter: HomeDetailPresenter?
    weak var coordinator: HomeCoordinator?
    
    var index: Int = .zero
    
    init(presenter: HomeDetailPresenter, coordinator: HomeCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
}
