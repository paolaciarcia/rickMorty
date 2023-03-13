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

    //será colocado na viewcontroller(navigationBar)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.characters
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//será colocado na viewcontroller(navigationBar)
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
//        button.tintColor
        button.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let headerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.rickMortyHeader)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 24
        layout.itemSize = CGSize(width: 186, height: 244)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
//        collection.dataSource = AvatarDataSource(avatarList: )
//        collection.delegate
        collection.register(AvatarViewCell.self, forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
        backgroundColor = .systemGray5
    }

    private func setupViewHierarchy() {
        addSubview(headerImageView)
        addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),

            collectionView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
//            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -14),
        ])
    }

    private func bindLayoutEvents() {

    }

    @objc
    private func searchButtonTap() {
        didTapSearch?()
    }

    func show(viewModel: [AvatarCellViewModel]) {
        let dataSource = AvatarDataSource(avatarList: viewModel)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource

        dataSource.didSelect = { [weak self] cell in
            self?.didSelectItem?(cell)
        }
        
    }
}
