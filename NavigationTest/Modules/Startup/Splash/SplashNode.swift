//
//  SplashNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import Foundation

final class SplashNode: NodeProtocol {

    var presenter: SplashPresenter
    var intercator: SplashInteractor
    var view: SplashView
    
    weak var coordinator: StartupCoordinator?
    
    var showStyle: ShowStyle {
        .push
    }
    
    init(coordinator: StartupCoordinator) {
        presenter = SplashPresenter()
        intercator = SplashInteractor(presenter: presenter, coordinator: coordinator)
        view = SplashView(interactor: intercator)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
