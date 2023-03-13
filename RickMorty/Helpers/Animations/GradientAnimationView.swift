//
//  GradientLoading.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import QuartzCore
import UIKit

final class GradientAnimationView: UIView {
    let view = UIView()

    let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let colors = [
            UIColor.systemGray2.cgColor,
            UIColor.systemGray3.cgColor,
            UIColor.systemGray4.cgColor
        ]
        gradientLayer.colors = colors

        let locations: [NSNumber] = [
            0.0,
            0.25,
            0.5,
            0.75,
            1.0
        ]
        gradientLayer.locations = locations

        let duration = 1.25

        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 1.0
        alphaAnimation.toValue = 0.25
        alphaAnimation.duration = duration
        alphaAnimation.repeatCount = .infinity
        gradientLayer.add(alphaAnimation, forKey: "opacity")

        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.0]
        gradientAnimation.toValue = [0.25, 0.75, 1.0]
        gradientAnimation.duration = duration
        gradientAnimation.repeatCount = .infinity
        gradientLayer.add(gradientAnimation, forKey: "locations")
        return gradientLayer
    }()

    override func layoutSubviews() {
        gradientLayer.frame = CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: bounds.size.width,
            height: bounds.size.height
        )
        gradientLayer.cornerRadius = 16
    }

    override func didMoveToWindow() {
        layer.addSublayer(gradientLayer)
    }

    init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
