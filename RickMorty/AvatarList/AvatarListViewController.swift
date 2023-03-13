//
//  AvatarViewController.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 09/03/23.
//

import UIKit

final class AvatarListViewController: UIViewController {
    private let contentView: AvatarListView

    init(contentView: AvatarListView = AvatarListView()) {
        self.contentView = contentView
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

    private func bindLayoutEvents() {
        
    }
}
