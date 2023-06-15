//
//  ProfileNode.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileNode: NodeProtocol {

    var presenter: ProfilePresenter
    var interactor: ProfileInteractor
    var view: ProfileView
    
    weak var coordinator: ProfileCoordinator?
    
    var showStyle: ShowStyle {
        .root
    }
    
    init(coordinator: ProfileCoordinator) {
        presenter = ProfilePresenter()
        interactor = ProfileInteractor(presenter: presenter, coordinator: coordinator)
        view = ProfileView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
