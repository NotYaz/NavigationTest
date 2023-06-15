//
//  SplashView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import Foundation
import UIKit
import PinLayout

final class SplashView: UIViewController, ViewProtocol {
    
    weak var interactor: SplashInteractor?
    
    private let titleLabel = UILabel(font: .systemFont(ofSize: 32.0),
                                     color: .white,
                                     text: "Okko App",
                                     alignment: .center)
    
    init(interactor: SplashInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "Main Blueberry")
        
        view.add(subviews: titleLabel)
        
        titleLabel.pin
            .center()
            .sizeToFit()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.interactor?.showProfileSelection()
        }
    }
}
