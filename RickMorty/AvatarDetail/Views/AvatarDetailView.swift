//
//  AvatarDetailView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

final class AvatarDetailView: UIView {
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 2
        image.layer.borderColor = CGColor(red: 0, green: 100, blue: 0, alpha: 100)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondarySystemFill
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(red: 0, green: 100, blue: 0, alpha: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let informationView = AvatarInformationView()

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
        addSubview(rectangleView)
        addSubview(informationView)
        addSubview(avatarImage)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            avatarImage.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),

            informationView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 24),
            informationView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 16),
            informationView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -16),
            informationView.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -16),

            rectangleView.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 142),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rectangleView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -70)
        ])
    }
}

extension AvatarDetailView: AvatarDetailViewType {
    func show(viewModel: AvatarInformationViewModel) {
        avatarImage.downloadImage(url: viewModel.avatarImage,
                                  placeholderImage: viewModel.placeholderImage)
        informationView.show(viewModel: viewModel)
    }
}
