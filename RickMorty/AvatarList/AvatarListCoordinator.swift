//
//  AvatarListCoordinator.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import UIKit
import Network

final class AvatarListCoordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController

//    weak var currentActionSheet: UIActionSheet?

    private let viewModel: AvatarListViewModel

    init(navigationController: UINavigationController,
         viewModel: AvatarListViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }

    func start() {
        let presenter = AvatarListPresenter(viewModel: viewModel)
        let viewController = AvatarListViewController(presenter: presenter)
        presenter.viewController = viewController
        viewController.delegate = self
        currentViewController = viewController
        navigationController.show(viewController, sender: nil)
    }

    private func redirectToAvatarFilter() {
        let viewController = AvatarSearchViewController()
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AvatarListCoordinator: AvatarListViewControllerDelegate {
    func showAvatarDetail(with viewModel: AvatarCellViewModel) {
        let presenter = AvatarDetailPresenter(viewModel: viewModel)
        let viewController = AvatarDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        currentViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }

    func openAvatarFilter() {
        redirectToAvatarFilter()
    }
}
