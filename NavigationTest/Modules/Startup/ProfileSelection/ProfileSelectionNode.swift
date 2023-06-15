//
//  ProfileSelectionNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation

final class ProfileSelectionNode: NodeProtocol {

    var presenter: ProfileSelectionPresenter
    var interactor: ProfileSelectionInteractor
    var view: ProfileSelectionView
    
    weak var coordinator: StartupCoordinator?
    
    var showStyle: ShowStyle {
        .push
    }
    
    init(coordinator: StartupCoordinator) {
        presenter = ProfileSelectionPresenter()
        interactor = ProfileSelectionInteractor(presenter: presenter, coordinator: coordinator)
        view = ProfileSelectionView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
