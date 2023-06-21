//
//  BagView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation
import UIKit

final class BagView: UIViewController, ViewProtocol {
    
    weak var interactor: BagInteractor?
    
    init(interactor: BagInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {

        view.backgroundColor = .white
        
        let headerView = HeaderView()
        headerView.setup(with: "Мое")
        headerView.delegate = self
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(CommonViewCell.self, forCellWithReuseIdentifier: CommonViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        
        let downloadsLabel = UILabel(font: .boldSystemFont(ofSize: 12.0), color: .black, text: "Загрузки", alignment: .center)
        
        let rembemberedLabel = UILabel(font: .boldSystemFont(ofSize: 12.0), color: .black, text: "Запомненные",  alignment: .center)
        
        let myPurchasesLabel = UILabel(font: .boldSystemFont(ofSize: 12.0), color: .black, text: "Загрузки",  alignment: .center)
        
        let bagMenuStackView = UIStackView(.horizontal,
                                           spacing: 5.0,
                                           distribution: .fill,
                                           views: [downloadsLabel, rembemberedLabel, myPurchasesLabel])
        
        bagMenuStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.add(subviews: headerView, bagMenuStackView, collectionView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 52.0),
            bagMenuStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12.0),
            bagMenuStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12.0),
            bagMenuStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12.0),
            bagMenuStackView.heightAnchor.constraint(equalToConstant: 20.0),
            collectionView.topAnchor.constraint(equalTo: bagMenuStackView.bottomAnchor, constant: 12.0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

extension BagView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 48
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonViewCell.reuseIdentifier, for: indexPath) as? CommonViewCell else { return CommonViewCell() }
        return cell
    }
}

extension BagView: HeaderViewDelegate {

    func didSelectedProfile() {
        interactor?.didSelectProfile()
    }
    
}
