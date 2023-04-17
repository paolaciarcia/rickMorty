//
//  AppDelegate.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AvatarListCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()
        let viewModel = AvatarListViewModel(cells: [])

        coordinator = AvatarListCoordinator(navigationController: navController,
                                            viewModel: viewModel)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
