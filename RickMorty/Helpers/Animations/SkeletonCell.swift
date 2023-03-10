//
//  AvatarLoadingViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit
import SkeletonView

//let gradient = SkeletonGradient(baseColor: UIColor(red: 126.0/255.0, green: 126.0/255.0, blue: 129.0/255.0, alpha: 1.0),
//                                secondaryColor: UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 74, alpha: 1.0))

final class SkeletonCell: UICollectionViewCell {
    private let radiusView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
let animationView = GradientAnimationView()
//    private let loadingCellView: UIView = {
//        let loadingCell = UIView()
//        loadingCell.isSkeletonable = true
//
//        let animation = GradientDirection.leftRight.slidingAnimation()
//        let gradient = SkeletonGradient(baseColor: .asbestos,
//                                        secondaryColor: .concrete)
//        loadingCell.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
//        loadingCell.backgroundColor = .systemGray3
//
//
//        loadingCell.layer.cornerRadius = 16
//        loadingCell.translatesAutoresizingMaskIntoConstraints = false
//        return loadingCell
//    }()

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
        animationView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViewHierarchy() {
        addSubview(radiusView)
        radiusView.addSubview(animationView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            radiusView.topAnchor.constraint(equalTo: topAnchor),
            radiusView.leadingAnchor.constraint(equalTo: leadingAnchor),
            radiusView.trailingAnchor.constraint(equalTo: trailingAnchor),
            radiusView.bottomAnchor.constraint(equalTo: bottomAnchor),

            animationView.topAnchor.constraint(equalTo: radiusView.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: radiusView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: radiusView.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: radiusView.bottomAnchor)
        ])
    }
}
