//
//  HomeListInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class HomeListInteractor: InteractorProtocol {
    
    var presenter: HomeListPresenter
    
    init(presenter: HomeListPresenter) {
        self.presenter = presenter
    }
    
}
