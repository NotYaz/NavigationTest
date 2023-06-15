//
//  SplashInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import Foundation

final class SplashInteractor: InteractorProtocol {

    weak var presenter: SplashPresenter?
    var coordinator: StartupCoordinator?
    
    init(presenter: SplashPresenter, coordinator: StartupCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func showProfileSelection() {
        coordinator?.showProfileSelection()
    }
}
