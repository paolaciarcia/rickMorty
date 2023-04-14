//
//  AvatarViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 09/03/23.
//

import UIKit

final class AvatarListViewController: UIViewController {
    weak var delegate: AvatarListViewControllerDelegate?

    private let contentView: AvatarListView
    private let presenter: AvatarListPresenterType

    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(searchButtonTap))
        return button
    }()

    init(contentView: AvatarListView = AvatarListView(),
         presenter: AvatarListPresenterType) {
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
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
//        presenter.loadAvatarList()
        super.viewWillAppear(animated)
        setupNavigation()
    }

    private func bindLayoutEvents() {
        contentView.didSelectItem = { [weak self] item in
            self?.presenter.getAvatarDetail(index: item)
        }

        contentView.didSelectReloadList = { [weak self] in
            self?.presenter.loadAvatarList()
        }

        contentView.didRefrashItems = { [weak self] isRefreshing in
            if isRefreshing {
                self?.presenter.loadAvatarList()
            }
        }
    }

    private func setupNavigation() {
        navigationController?.applyCustomAppearence()
        navigationController?.navigationBar.backItem?.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = searchButton
        title = L10n.characters
    }

    @objc
    private func searchButtonTap() {
        delegate?.openAvatarFilter(filterDelegate: self)
    }
}

extension AvatarListViewController: AvatarListViewControllerType {
    func show(state: AvatarListState) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            if state == .error || state == .loading {
                self?.navigationController?.isNavigationBarHidden = true
            } else {
                self?.navigationController?.isNavigationBarHidden = false
            }
            self?.contentView.show(state: state)
        }
    }

    func redirectToAvatarDetail(with viewModel: AvatarCellViewModel) {
        delegate?.showAvatarDetail(with: viewModel)
    }
}

extension AvatarListViewController: AvatarSearchFilterDelegate {
    func didUpdateFilterOptions(name: String?, status: String?) {
        presenter.updateFilterOptions(name: name, status: status)
    }
}
