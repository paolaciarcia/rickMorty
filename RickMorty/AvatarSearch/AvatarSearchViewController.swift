//
//  AvatarSearchViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 11/04/23.
//

import UIKit

final class AvatarSearchViewController: UIViewController {
    private let contentView: AvatarSearchView

    init(contentView: AvatarSearchView = AvatarSearchView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }
}

extension AvatarSearchViewController: AvatarSearchViewControllerType {
    func show(viewModel: [StatusCellViewModel]) {}
}
