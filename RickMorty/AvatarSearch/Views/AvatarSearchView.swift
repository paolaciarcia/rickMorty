//
//  AvatarSearchView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 31/03/23.
//

import UIKit

final class AvatarSearchView: UIView {
    var didSelectStatus: ((_ isSelected: Bool) -> Void)?

    private let dataSource = AvatarSearchDataSource()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.name
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.textFieldDefaultName
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.status
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        flowLayout.minimumLineSpacing = 20
        flowLayout.itemSize = CGSize(width: width * 0.2, height: 34)
        return flowLayout
    }()

    private lazy var statusCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.register(AvatarSearchViewCell.self, forCellWithReuseIdentifier: String(describing: AvatarSearchViewCell.self))
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection

    }()

    private let filterButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.filter.uppercased(), for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

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
        backgroundColor = .systemGray5
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(nameLabel)
        addSubview(searchTextField)
        addSubview(statusLabel)
        addSubview(statusCollectionView)
        addSubview(filterButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

        ])
    }

    private func bindLayoutEvents() {

    }

    func show() {
        
        statusCollectionView.reloadData()
    }
}

extension AvatarSearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
}
