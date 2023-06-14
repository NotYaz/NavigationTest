//
//  profileInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileInteractor: InteractorProtocol {
    
    weak var presenter: ProfilePresenter?
    weak var coordinator: ProfileCoordinator?
    
    init(presenter: ProfilePresenter, coordinator: ProfileCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }
    
}
