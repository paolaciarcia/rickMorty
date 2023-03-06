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
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let reloadLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.tryAgain
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()

    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.reloadIcon), for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
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
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(errorDescriptionLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(reloadLabel)
        stackView.addArrangedSubview(reloadButton)

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: (self.bounds.height/2) + 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: leadingAnchor),

            errorDescriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 34),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),

            stackView.topAnchor.constraint(equalTo: errorDescriptionLabel.topAnchor, constant: 26),
            stackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16)
//            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16)
        ])
    }

    @objc
    private func buttonTap() {
        didSelectReloadList?()
    }
}
