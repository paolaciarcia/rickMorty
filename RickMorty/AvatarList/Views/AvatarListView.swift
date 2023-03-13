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

    private let readyView: AvatarCollectionView = {
        let view = AvatarCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loadingView: AvatarLoadingView = {
        let view = AvatarLoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let errorView: AvatarErrorView = {
        let view = AvatarErrorView()
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
        readyView.didSelectItem = { [weak self] item in
            self?.didSelectItem?(item)
        }

        errorView.didSelectReloadList = { [weak self] in
            self?.didSelectReloadList?()
        }
    }

    private func setupViewHierarchy() {
        addSubview(readyView)
        addSubview(loadingView)
        addSubview(errorView)
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
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension AvatarListView: AvatarListViewType {
    func show(state: AvatarListState) {
        switch state {
        case .ready(let viewModel):
            readyView.show(viewModel: viewModel.cells)
            loadingView.isHidden = true
            errorView.isHidden = true
        case .loading:
            loadingView.isHidden = false
            readyView.isHidden = true
            errorView.isHidden = true
        case .error:
            errorView.isHidden = false
            readyView.isHidden = true
            loadingView.isHidden = true
        }
    }
}
