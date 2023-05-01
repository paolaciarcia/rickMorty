//
//  AvatarListView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import UIKit

final class AvatarListView: UIView {
    var didSelectItem: ((Int) -> Void)?
    var didSelectReloadList: (() -> Void)?
    var didSelectNewSearch: (() -> Void)?
    var fetchNewItems: (() -> Void)?

    private let readyView: AvatarCollectionView = {
        let view = AvatarCollectionView()
        view.isHidden = true
        view.accessibilityIdentifier = "viewReady"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loadingView: AvatarLoadingView = {
        let view = AvatarLoadingView()
        view.isHidden = true
        view.accessibilityIdentifier = "viewLoading"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let errorView: AvatarErrorView = {
        let view = AvatarErrorView()
        view.isHidden = true
        view.accessibilityIdentifier = "viewError"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let emptyStateView: AvatarEmptyStateView = {
        let view = AvatarEmptyStateView()
        view.isHidden = true
        view.accessibilityIdentifier = "viewEmptyState"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        bindLayoutEvents()
        setupViewHierarchy()
        setupConstraints()
    }

    private func bindLayoutEvents() {
        readyView.didSelectItem = { item in
            self.didSelectItem?(item)
        }

        readyView.shouldFetchNewItems = {
            self.fetchNewItems?()
        }

        errorView.didSelectReloadList = {
            self.didSelectReloadList?()
        }

        emptyStateView.didSelectNewSearch = {
            self.didSelectNewSearch?()
        }
    }

    private func setupViewHierarchy() {
        addSubview(loadingView)
        addSubview(readyView)
        addSubview(errorView)
        addSubview(emptyStateView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            readyView.topAnchor.constraint(equalTo: topAnchor),
            readyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            readyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            readyView.bottomAnchor.constraint(equalTo: bottomAnchor),

            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),

            errorView.topAnchor.constraint(equalTo: topAnchor),
            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor),

            emptyStateView.topAnchor.constraint(equalTo: topAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyStateView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AvatarListView: AvatarListViewType {
    func show(state: AvatarListState) {
        switch state {
        case .ready(let viewModel):
            readyView.isHidden = false
            readyView.show(viewModel: viewModel)
            loadingView.isHidden = true
            errorView.isHidden = true
            emptyStateView.isHidden = true
        case .loading:
            loadingView.isHidden = false
            readyView.isHidden = true
            errorView.isHidden = true
            emptyStateView.isHidden = true
        case .error:
            errorView.isHidden = false
            readyView.isHidden = true
            loadingView.isHidden = true
            emptyStateView.isHidden = true
        case .emptyState:
            emptyStateView.isHidden = false
            errorView.isHidden = true
            readyView.isHidden = true
            loadingView.isHidden = true
        }
    }
}
