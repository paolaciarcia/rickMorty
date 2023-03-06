//
//  GradientLoading.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import SkeletonView


//final class GradientLoadingViewController: UIViewController {
//    private let startColor: CGColor = UIColor(red: 126/255, green: 126/255, blue: 129/255, alpha: 1).cgColor
//    private let mediumColor: CGColor = UIColor(red: 100/255, green: 100/255, blue: 102/255, alpha: 1).cgColor
//    private let endColor: CGColor = UIColor(red: 72/255, green: 72/255, blue: 74/255, alpha: 1).cgColor
//
//    private let gradient: CAGradientLayer = CAGradientLayer()
//    private var gradientColorSet: [CGColor] = []
//    private var colorIndex: Int = 0
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupGradient()
//        animateGradient()
//    }
//
//    private func setupGradient() {
//        gradientColorSet = [startColor, mediumColor, endColor]
//        gradient.colors = gradientColorSet
//        gradient.frame = view.bounds
//        view.layer.addSublayer(gradient)
//    }
//
//    private func animateGradient() {
//        let gradientAnimation = CABasicAnimation(keyPath: "colors")
//        gradient.colors = gradientColorSet
//        gradientAnimation.duration = 3.0
//        gradientAnimation.delegate = self
//        gradientAnimation.fillMode = .forwards
//        gradientAnimation.isRemovedOnCompletion = false
//        gradient.add(gradientAnimation, forKey: "colors")
//
//    }
//}
//
//extension GradientLoadingViewController: CAAnimationDelegate {
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        if flag {
//            animateGradient()
//        }
//    }
//}
