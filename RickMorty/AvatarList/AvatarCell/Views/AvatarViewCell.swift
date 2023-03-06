//
//  AvatarViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarViewCell: UICollectionViewCell {
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(red: 122, green: 182, blue: 59, alpha: 1)
        view.backgroundColor = .secondarySystemFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 80
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
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
    }

    private func setupViewHierarchy() {
        addSubview(mainView)
        mainView.addSubview(avatarImage)
        mainView.addSubview(avatarLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),

            avatarImage.topAnchor.constraint(equalTo: mainView.topAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),

            avatarLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 18),
            avatarLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 18),
            avatarLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -18),
            avatarLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -18)

        ])
    }

    func show(viewModel: AvatarCellViewModel) {
        avatarImage.image = viewModel.avatarImage
        avatarLabel.text = viewModel.avatarName
    }
}
