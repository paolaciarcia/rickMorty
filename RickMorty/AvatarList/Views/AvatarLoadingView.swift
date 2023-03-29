//
//  AvatarLoadingView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarLoadingView: UIView {
    private let firstSkeletonCell = GradientAnimationView()
    private let secondSkeletonCell = GradientAnimationView()
    private let thirdSkeletonCell = GradientAnimationView()
    private let fourthSkeletonCell = GradientAnimationView()

    private let loadingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        backgroundColor = .systemGray5
        firstSkeletonCell.translatesAutoresizingMaskIntoConstraints = false
        secondSkeletonCell.translatesAutoresizingMaskIntoConstraints = false
        thirdSkeletonCell.translatesAutoresizingMaskIntoConstraints = false
        fourthSkeletonCell.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViewHierarchy() {
        addSubview(firstSkeletonCell)
        addSubview(secondSkeletonCell)
        addSubview(loadingStackView)
        loadingStackView.addArrangedSubview(thirdSkeletonCell)
        loadingStackView.addArrangedSubview(fourthSkeletonCell)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstSkeletonCell.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            firstSkeletonCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            firstSkeletonCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            firstSkeletonCell.heightAnchor.constraint(equalToConstant: 46),

            secondSkeletonCell.topAnchor.constraint(equalTo: firstSkeletonCell.bottomAnchor, constant: 24),
            secondSkeletonCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            secondSkeletonCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            secondSkeletonCell.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),

            loadingStackView.topAnchor.constraint(equalTo: secondSkeletonCell.bottomAnchor, constant: 40),
            loadingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            loadingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            loadingStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
    }
}
