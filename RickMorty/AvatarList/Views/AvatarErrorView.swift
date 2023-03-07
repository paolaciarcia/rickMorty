//
//  AvatarErrorView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarErrorView: UIView {
    var didSelectReloadList: (() -> Void)?

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.errorImage)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.errorDescription
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.tryAgain, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(UIImage(asset: Asset.reloadIcon), for: .normal)
        button.configuration = configurationButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.accessibilityIdentifier = "reloadButton"
        return button
    }()

    private func configurationButton() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.imagePlacement = .trailing
        config.imagePadding = 5
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
        addSubview(errorDescriptionLabel)
        addSubview(reloadButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            errorDescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            reloadButton.topAnchor.constraint(equalTo: errorDescriptionLabel.bottomAnchor, constant: 16),
            reloadButton.centerXAnchor.constraint(equalTo: errorDescriptionLabel.centerXAnchor)
        ])
    }

    @objc
    private func buttonTap() {
        didSelectReloadList?()
    }
}
