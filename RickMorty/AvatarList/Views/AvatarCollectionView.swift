//
//  AvatarListView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarCollectionView: UIView {
    var shouldFetchNewItems: (() -> Void)?
    var didSelectItem: ((Int) -> Void)?

    private let dataSource: AvatarDataSource

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(AvatarViewCell.self,
                            forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))

        collection.register(AvatarActivityIndicatorReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: String(describing: AvatarActivityIndicatorReusableView.self))

        collection.register(AvatarHeaderReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: String(describing: AvatarHeaderReusableView.self))

        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    init(dataSource: AvatarDataSource = AvatarDataSource()) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }

    private func setup() {
        setupViewHierarchy()
        bindLayoutEvents()
        backgroundColor = .systemGray5
    }

    private func setupViewHierarchy() {
        addSubview(collectionView)
    }

    private func bindLayoutEvents() {
        dataSource.didSelect = { [weak self] cell in
            self?.didSelectItem?(cell)
        }

        dataSource.shouldFetchNewItems = { [weak self] in
            self?.shouldFetchNewItems?()
        }
    }

    func show(viewModel: AvatarListViewModel) {
        dataSource.setupAvatarList(avatarList: viewModel)
        collectionView.reloadData()
    }
}
