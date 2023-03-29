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
        view.layer.borderColor = CGColor(red: 122.0/255.0,
                                         green: 182.0/255.0,
                                         blue: 59.0/255.0,
                                         alpha: 1.0)
        view.backgroundColor = .secondarySystemFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
            mainView.heightAnchor.constraint(equalToConstant: 40),
            mainView.widthAnchor.constraint(equalToConstant: 20),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),

            avatarLabel.topAnchor.constraint(lessThanOrEqualTo: mainView.topAnchor, constant: 20),
            avatarLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            avatarLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            avatarImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 27),
            avatarImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27),
            avatarImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -27),
            avatarImage.heightAnchor.constraint(lessThanOrEqualTo: mainView.heightAnchor, multiplier: 0.6)

        ])
    }

    func show(viewModel: AvatarCellViewModel) {
//        let firstWord = viewModel.avatarName.components(separatedBy: " ").first
//        let lastWord = viewModel.avatarName.components(separatedBy: " ").last
//        let avatarAbbrName = "\(firstWord ?? "") \(lastWord ?? "")"
        avatarLabel.text = viewModel.avatarName
        avatarImage.downloadImage(url: viewModel.avatarImageURL,
                                  placeholderImage: UIImage(asset: Asset.avatarRich))
        avatarLabel.text = viewModel.avatarName
    }
}
