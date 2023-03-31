//
//  AvatarEmptyStateView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 31/03/23.
//

import UIKit

final class AvatarEmptyStateView: UIView {
    var didSelectNewSearch: (() -> Void)?

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.emptyState)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let emptyStateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.errorDescription
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var newSearchButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.newSearch, for: .normal)
        button.configuration = configurationButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.accessibilityIdentifier = "newSearchButton"
        return button
    }()

    private func configurationButton() -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.titlePadding = 5
        return config
    }

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
        addSubview(imageView)
        addSubview(emptyStateDescriptionLabel)
        addSubview(newSearchButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            emptyStateDescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            emptyStateDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emptyStateDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            newSearchButton.topAnchor.constraint(equalTo: emptyStateDescriptionLabel.bottomAnchor, constant: 16),
            newSearchButton.centerXAnchor.constraint(equalTo: emptyStateDescriptionLabel.centerXAnchor)
        ])
    }

    @objc
    private func buttonTap() {
        didSelectNewSearch?()
    }
}
