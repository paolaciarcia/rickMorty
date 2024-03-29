//
//  AvatarInformationViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 30/03/23.
//

import UIKit

final class AvatarDetailViewController: UIViewController {
    private let contentView: AvatarDetailViewType
    private let presenter: AvatarDetailPresenterType

    init(contentView: AvatarDetailViewType = AvatarDetailView(),
         presenter: AvatarDetailPresenterType) {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadAvatarDetail()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func setupNavigation() {
        navigationController?.applyCustomAppearence()
        title = L10n.characterDetail

    }
}

extension AvatarDetailViewController: AvatarDetailViewControllerType {
    func showAvatarDetail(viewModel: AvatarInformationViewModel) {
        contentView.show(viewModel: viewModel)
    }
}
