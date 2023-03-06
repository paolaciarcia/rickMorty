//
//  AvatarLoadingViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit
import SkeletonView

final class AvatarLoadingViewCell: UICollectionViewCell {
    private let loadingCellView: UIView = {
        let loadingCell = UIView()
        loadingCell.layer.borderWidth = 16
        loadingCell.translatesAutoresizingMaskIntoConstraints = false
//        loadingCell.backgroundColor = UIColor(cgColor: CGColor(red: 151, green: 151, blue: 151, alpha: 1))
        loadingCell.isSkeletonable = true
        loadingCell.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(
            baseColor: UIColor(red: 126, green: 126, blue: 129, alpha: 1),
            secondaryColor: UIColor(red: 72, green: 72, blue: 74, alpha: 1)
        ))
        return loadingCell
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
        addSubview(loadingCellView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingCellView.topAnchor.constraint(equalTo: topAnchor),
            loadingCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingCellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
