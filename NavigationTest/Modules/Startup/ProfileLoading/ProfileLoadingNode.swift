//
//  ProfileLoadingNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation

final class ProfileLoadingNode: NodeProtocol {

    var presenter: ProfileLoadingPresenter
    var interactor: ProfileLoadingInteractor
    var view: ProfileLoadingView
    
    weak var coordinator: StartupCoordinator?
    
    var showStyle: ShowStyle { .custom(.changeRoot) }
    
    init(coordinator: StartupCoordinator) {
        presenter = ProfileLoadingPresenter()
        interactor = ProfileLoadingInteractor(presenter: presenter, coordinator: coordinator)
        view = ProfileLoadingView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
