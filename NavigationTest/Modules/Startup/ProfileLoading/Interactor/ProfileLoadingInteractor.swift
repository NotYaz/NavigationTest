//
//  ProfileLoadingInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation

final class ProfileLoadingInteractor: InteractorProtocol {

    weak var presenter: ProfileLoadingPresenter?
    var coordinator: StartupCoordinator?
    
    
    init(presenter: ProfileLoadingPresenter, coordinator: StartupCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
}
