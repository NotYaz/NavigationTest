//
//  HeaderView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation
import UIKit

final class HeaderView: UIView {
    
    private let titleLabel = UILabel(font: .systemFont(ofSize: 18.0, weight: .bold),
                                     color: .black,
                                     alignment: .left)
    
    private lazy var avatarView: UIButton = {
        let button = UIButton(backgroundColor: .cyan)
        button.layer.cornerRadius = 12.5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapProfile(_:)), for: .touchUpInside)
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    private func initUI() {

        backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        add(subviews: titleLabel, avatarView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12.0),
            avatarView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12.0),
            avatarView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 25),
            avatarView.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func setup(with title: String) {
        titleLabel.text = title
    }
    
    @objc func didTapProfile(_ sender: UIButton) {
        // TODO: - Open Profile Screen
    }
    
}
