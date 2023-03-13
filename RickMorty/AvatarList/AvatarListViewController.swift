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
         presenter: AvatarListPresenterType = AvatarListPresenter()) {
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
        presenter.loadAvatarList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }

    private func bindLayoutEvents() {
        contentView.didSelectItem = { [weak self] item in
            // self?.delegate?.showAvatarDetail(from: item)
        }

        contentView.didSelectReloadList = { [weak self] in
            self?.presenter.loadAvatarList()
        }
    }

    private func setupNavBar() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        navigationController.applyCustomAppearence()
        title = L10n.characters
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc
    private func searchButtonTap() {
        //self?.delegate?.openAvatarFilter()
    }
}

extension AvatarListViewController: AvatarListViewControllerType {
    func show(state: AvatarListState) {
        switch state {
        case .ready:
            navigationController?.navigationBar.isHidden = false
            contentView.show(state: state)
        default:
            navigationController?.navigationBar.isHidden = true
        }
    }
}
