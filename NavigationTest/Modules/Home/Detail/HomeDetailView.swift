//
//  HomeDetailView.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class HomeDetailView: UIViewController, ViewProtocol {
    
    weak var interactor: HomeDetailInteractor?
    
    init(interactor: HomeDetailInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
