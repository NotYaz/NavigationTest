//
//  ProfileNode.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileNode: NodeProtocol {

    var presenter: ProfilePresenter
    var intercator: ProfileInteractor
    var view: ProfileView
    
    var showStyle: ShowStyle {
        .tabbar
    }
    
    init() {
        presenter = ProfilePresenter()
        intercator = ProfileInteractor(presenter: presenter)
        view = ProfileView(interactor: intercator)
        presenter.view = view
    }
    
}
