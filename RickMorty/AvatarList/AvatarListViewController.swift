//
//  AvatarViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 09/03/23.
//

import UIKit

final class AvatarListViewController: UIViewController {
    private let contentView: AvatarListView
    private let presenter: AvatarListPresenterType

    private lazy var searchButton: UIBarButtonItem = {
        return UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(searchButtonTap))
    }()

    init(contentView: AvatarListView = AvatarListView(),
         presenter: AvatarListPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.viewController = self
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
        presenter.loadAvatarList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func bindLayoutEvents() {
        contentView.didSelectItem = { [weak self] item in
            // self?.delegate?.showAvatarDetail(from: item)
        }

        contentView.didSelectReloadList = { [weak self] in
            self?.presenter.loadAvatarList()
        }
    }

    private func setupNavigation() {
        title = L10n.characters
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc
    private func searchButtonTap() {
        //self?.delegate?.openAvatarFilter()
    }
}

extension AvatarListViewController: AvatarListViewControllerType {
    func show(state: AvatarListState) {
        DispatchQueue.main.async { [weak self] in
            self?.contentView.show(state: state)
        }
    }
}
