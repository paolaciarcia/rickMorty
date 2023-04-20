//
//  UINavigationControllerSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//
import UIKit

@testable import RickMorty

final class UINavigationControllerSpy: UINavigationController {
    private(set) var showCallCount = 0
    private(set) var expectedViewController: UIViewController?

    override func show(_ vc: UIViewController, sender: Any?) {
        showCallCount += 1
        expectedViewController = vc
    }

    private(set) var pushViewControllerCallCount = 0

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCallCount += 1
        expectedViewController = viewController
    }

    private(set) var popViewControllerCallCount = 0

    override func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCallCount += 1
        return UIViewController()
    }
}
