//
//  AvatarSearchViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 11/04/23.
//

import UIKit

final class AvatarSearchViewController: UIViewController {
    private let contentView: AvatarSearchView
    private let presenter: AvatarSearchPresenterType

    weak var delegate: AvatarSearchViewControllerDelegate?

    init(contentView: AvatarSearchView = AvatarSearchView(),
         presenter: AvatarSearchPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func setupNavigation() {
        navigationController?.applyCustomAppearence()
        navigationController?.navigationBar.backItem?.title = "Back"
        title = L10n.filters

    }
}

extension AvatarSearchViewController: AvatarSearchViewControllerType {
    func show(viewModel: [StatusCellViewModel]) {}
}
