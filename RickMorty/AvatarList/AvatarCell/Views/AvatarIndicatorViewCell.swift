//
//  AvatarIndicatorViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/04/23.
//

import UIKit

final class AvatarIndicatorViewCell: UICollectionReusableView {

    private let indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .medium
        view.layoutIfNeeded()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(indicatorView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
