//
//  MovieCardView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 20.06.2023.
//

import Foundation
import UIKit

final class MovieCardView: UIViewController, ViewProtocol {

    var interactor: MovieCardInteractor?
    
    init(interactor: MovieCardInteractor) {
        self.interactor = interactor

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        let movieCardView = UIView(backgroundColor: UIColor(named: "Blue Background") ?? .blue)
        movieCardView.translatesAutoresizingMaskIntoConstraints = false
        
        let watchButton = UIButton()
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.setTitle("Смотреть по подписке", for: .normal)
        watchButton.setTitleColor(.white, for: .normal)
        watchButton.backgroundColor = UIColor(named: "Blueberry Button Text") ?? .purple
        
        view.add(subviews: movieCardView, watchButton)
        
        NSLayoutConstraint.activate([
            movieCardView.topAnchor.constraint(equalTo: view.topAnchor),
            movieCardView.leftAnchor.constraint(equalTo: view.leftAnchor),
            movieCardView.rightAnchor.constraint(equalTo: view.rightAnchor),
            movieCardView.heightAnchor.constraint(equalToConstant: 300),
            watchButton.heightAnchor.constraint(equalToConstant: 52),
            watchButton.topAnchor.constraint(equalTo: movieCardView.bottomAnchor, constant: 12.0),
            watchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22.0),
            watchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22.0)
        ])
        
    }
    

}
