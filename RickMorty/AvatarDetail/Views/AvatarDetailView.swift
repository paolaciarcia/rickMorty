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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(red: 48, green: 209, blue: 88, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let informationView = AvatarInformationView()

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
        addSubview(avatarImage)
        addSubview(rectangleView)
        addSubview(informationView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 64),

            rectangleView.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: avatarImage.frame.height/2),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),

            informationView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 24),
            informationView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 50),
            informationView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: 50)
        ])
    }
}

extension AvatarDetailView: AvatarInformationViewType {
    func show(viewModel: AvatarInformationViewModel) {
        avatarImage.image = viewModel.avatarImage
        informationView.show(viewModel: viewModel)
    }
}
