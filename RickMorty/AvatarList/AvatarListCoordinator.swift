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
}

extension AvatarListCoordinator: AvatarListViewControllerDelegate {
    func showAvatarDetail(with: AvatarCellViewModel) {
        <#code#>
    }
}
