//
//  AvatarSearchViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 03/04/23.
//

import UIKit

final class AvatarSearchViewCell: UICollectionViewCell {
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .secondarySystemFill : .systemGray4
            nameLabel.textColor = isSelected ? .systemBlue : .systemGray
        }
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        layer.cornerRadius = 16
        backgroundColor = .systemGray4
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(nameLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    func show(avatarStatus: String) {
        nameLabel.text = avatarStatus
    }
}
