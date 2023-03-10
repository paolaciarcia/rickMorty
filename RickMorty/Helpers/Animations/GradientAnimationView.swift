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

//        let colors = [
//            UIColor(red: 126.0/255.0, green: 126.0/255.0, blue: 129.0/255.0, alpha: 1.0),
//            UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 102.0/255.0, alpha: 1.0),
//            UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 74.0/255.0, alpha: 1.0)
//        ]

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

        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.0]
        gradientAnimation.toValue = [0.25, 0.75, 1.0]
        gradientAnimation.duration = 2.5
        gradientAnimation.repeatCount = .infinity
//        gradientAnimation.fillMode = .forwards
        gradientLayer.add(gradientAnimation, forKey: nil)
        return gradientLayer
    }()

    override func layoutSubviews() {
        gradientLayer.frame = CGRect(
            x: bounds.origin.x,
            y: bounds.origin.y,
            width: bounds.size.width,
            height: bounds.size.height)
        gradientLayer.cornerRadius = 16
    }

    override func didMoveToWindow() {
        layer.addSublayer(gradientLayer)
    }
//    private let gradient: CAGradientLayer = {

//        let gradientColors = [
//            UIColor(red: 126.0/255.0, green: 126.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor,
//            UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 74.0/255.0, alpha: 1.0).cgColor
//        ]
//        gradientChangeAnimation.duration = 1.0
//        gradientChangeAnimation.toValue = gradientColors
//        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
//        gradientChangeAnimation.isRemovedOnCompletion = false
//
//        let gradient = CAGradientLayer()
//        gradient.startPoint = CGPoint(x:0, y:0)
//        gradient.endPoint = CGPoint(x:1, y:0)
//        gradient.add(gradientChangeAnimation, forKey: "colorChange")
//        mainView.layer.addSublayer(gradient)
//        mainView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        return gradient
//    }()

    init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
