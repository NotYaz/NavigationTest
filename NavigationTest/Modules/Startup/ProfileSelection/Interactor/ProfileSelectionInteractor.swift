//
//  ProfileSelectionInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation

final class ProfileSelectionInteractor: InteractorProtocol {
    
    weak var presenter: ProfileSelectionPresenter?
    var coordinator: StartupCoordinator?
    
    init(presenter: ProfileSelectionPresenter, coordinator: StartupCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
    func showProfileLoading() {
        coordinator?.showProfileLoading()
    }
    
}
