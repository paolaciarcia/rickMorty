//
//  AvatarSearchViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 03/04/23.
//

import UIKit

final class AvatarSearchViewCell: UICollectionViewCell {
    var didSelectStatus: ((_ isSelected: Bool) -> Void)?

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        statusButton.frame = bounds
    }

    @objc
    private func buttonTap() {
        didSelectStatus = { isSelected in
            self.didSelectStatus?(isSelected)
            self.setupButtonAppearence(isSelected: isSelected)
            
        }
    }

    private func setupButtonAppearence(isSelected: Bool) {
        statusButton.isSelected = isSelected
        if isSelected {
            statusButton.setTitleColor(.systemBlue, for: .normal)
            statusButton.backgroundColor = .secondarySystemFill
        } else {
            statusButton.setTitleColor(.systemGray, for: .normal)
            statusButton.backgroundColor = .secondaryLabel
        }
    }

    func show(viewModel: StatusCellViewModel) {
        statusButton.setTitle(viewModel.statusDescription.capitalized, for: .normal)
    }
}
