//
//  AvatarLoadingView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarLoadingView: UIView {
    private let firstSkeletonCell = SkeletonCell()
    private let secondSkeletonCell = SkeletonCell()

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
        addSubview(firstSkeletonCell)
        addSubview(secondSkeletonCell)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstSkeletonCell.topAnchor.constraint(equalTo: topAnchor),
            firstSkeletonCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstSkeletonCell.trailingAnchor.constraint(equalTo: trailingAnchor),

            secondSkeletonCell.topAnchor.constraint(equalTo: firstSkeletonCell.bottomAnchor, constant: 24),
            secondSkeletonCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondSkeletonCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondSkeletonCell.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
