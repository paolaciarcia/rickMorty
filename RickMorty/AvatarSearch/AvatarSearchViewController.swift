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
    weak var filterDelegate: AvatarSearchFilterDelegate?

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

    override func viewDidLoad() {
        super.viewDidLoad()
        bindLayoutEvents()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func setupNavigation() {
        navigationController?.applyCustomAppearence()
        title = L10n.filters

    }

    private func bindLayoutEvents() {
        contentView.textFieldInput = { [weak self] name in
            self?.presenter.filterAvatar(name: name)
        }

        contentView.selectedStatus = { [weak self] status in
            self?.presenter.filterAvatar(status: status)
        }

        contentView.didTapFilter = { [weak self] in
            self?.presenter.filterAvatar()
        }
    }
}

extension AvatarSearchViewController: AvatarSearchViewControllerType {
    func filterAvatar(name: String?, status: String?) {
        filterDelegate?.didUpdateFilterOptions(name: name, status: status)
        delegate?.showFilteredAvatar()
    }
}
