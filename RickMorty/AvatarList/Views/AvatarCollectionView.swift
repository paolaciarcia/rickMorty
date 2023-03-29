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

    private let dataSource = AvatarDataSource()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.characters
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        let width = UIScreen.main.bounds.width
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: width * 0.44, height: 250)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collection.register(AvatarViewCell.self, forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))
        collection.dataSource = dataSource
        collection.delegate = dataSource
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
        bindLayoutEvents()
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
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -14)
        ])
    }

    private func bindLayoutEvents() {
        dataSource.didSelect = { [weak self] cell in
            self?.didSelectItem?(cell)
        }
    }

    func show(viewModel: [AvatarCellViewModel]) {
        dataSource.setupAvatarList(avatarList: viewModel)
        collectionView.reloadData()
    }
}
