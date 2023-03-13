//
//  UINavigationController+Ext.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import UIKit

extension UINavigationController {
    func applyCustomAppearence() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(.white)]
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.isTranslucent = false
        navigationBar.prefersLargeTitles = true
    }
}
