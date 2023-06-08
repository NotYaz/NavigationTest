//
//  HomeListNode.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeListNode: NodeProtocol {

    var presenter: HomeListPresenter
    var intercator: HomeListInteractor
    var view: HomeListView
    
    var showStyle: ShowStyle {
        .tabbar
    }
    
    init() {
        presenter = HomeListPresenter()
        intercator = HomeListInteractor(presenter: presenter)
        view = HomeListView(interactor: intercator)
        presenter.view = view
    }
    
}
