//
//  AvatarListCoordinator.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import UIKit
import Network

final class AvatarListCoordinator {
    var navigationController: UINavigationController

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
        navigationController.show(viewController, sender: nil)
    }
}

extension AvatarListCoordinator: AvatarListViewControllerDelegate {
    func showAvatarDetail(with viewModel: AvatarCellViewModel) {
        let presenter = AvatarDetailPresenter(viewModel: viewModel)
        let viewController = AvatarDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }

    func openAvatarFilter(filterDelegate: AvatarSearchFilterDelegate) {
        let presenter = AvatarSearchPresenter()
        let viewController = AvatarSearchViewController(presenter: presenter)
        presenter.viewController = viewController
        viewController.delegate = self
        viewController.filterDelegate = filterDelegate
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AvatarListCoordinator: AvatarSearchViewControllerDelegate {
    func showFilteredAvatar() {
        navigationController.popViewController(animated: true)
    }
}
