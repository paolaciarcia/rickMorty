//
//  AvatarListView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarCollectionView: UIView {
//    var didSelectReloadList: (() -> Void)?
    var didSelectItem: ((Int) -> Void)?
    var didTapSearch: (() -> Void)?

    //ViewController - navigation title
//    private let headImageView: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(asset: Asset.rickMortyHeader)
//        image.contentMode = .scaleToFill
//        image.clipsToBounds = true
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()

    private let avatarNameLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.characters
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//ViewController - navigation right bar icon
//    private lazy var searchButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(asset: Asset.reloadIcon), for: .normal)
//        button.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)
//        return button
//    }()

    private let collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 24

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        //show
//        collection.dataSource = AvatarDataSource(avatarList: )
//        collection.delegate
        collection.register(AvatarViewCell.self, forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))
        collection.backgroundColor = UIColor(cgColor: CGColor(red: 47, green: 41, blue: 41, alpha: 1))
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private let loadingView = AvatarLoadingView()

    private let errorView = AvatarErrorView()

    @objc
    private func searchButtonTap() {
        didTapSearch?()
    }
}
