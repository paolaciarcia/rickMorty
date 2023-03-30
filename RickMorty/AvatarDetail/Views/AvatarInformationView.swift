//
//  AvatarInformationView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

final class AvatarInformationView: UIStackView {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let statusImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let informationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupStackView()
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupStackView() {
        spacing = 8
        axis = .vertical
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViewHierarchy() {
        addArrangedSubview(nameLabel)
        addArrangedSubview(stackView)
        addArrangedSubview(genderLabel)
        addArrangedSubview(typeLabel)

        stackView.addArrangedSubview(statusImage)
        stackView.addArrangedSubview(informationLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statusImage.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
}

extension AvatarInformationView: AvatarInformationViewType {
    func show(viewModel: AvatarInformationViewModel) {
        nameLabel.text = viewModel.name
        statusImage.image = viewModel.getIcon
        informationLabel.text = "\(viewModel.status) - \(viewModel.specie)"
        genderLabel.text = viewModel.gender
        typeLabel.text = viewModel.type
    }
}
