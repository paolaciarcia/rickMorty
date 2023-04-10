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

    var shouldRefreshItems: ((Bool) -> Void)?
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

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(AvatarViewCell.self,
                            forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))
        collection.register(AvatarHeaderReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: String(describing: AvatarHeaderReusableView.self))
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

//    let refreshControl = UIRefreshControl()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        return refreshControl
    }()

    init() {
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

        dataSource.shouldRefreshItems = { [weak self] isRefreshing in
            self?.shouldRefreshItems?(isRefreshing)
        }
    }

    @objc
    func loadData() {
        refreshControl.beginRefreshing()
        refreshControl.layoutIfNeeded()
        dataSource.shouldRefreshItems = { [weak self] isRefreshing in
            self?.shouldRefreshItems?(isRefreshing)
        }
        refreshControl.endRefreshing()
    }

    func show(viewModel: [AvatarCellViewModel]) {
        dataSource.setupAvatarList(avatarList: viewModel)
        collectionView.reloadData()
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
    }
}
