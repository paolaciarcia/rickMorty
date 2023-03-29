//
//  AvatarHeaderReusableView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 29/03/23.
//

import UIKit

final class AvatarHeaderReusableView: UICollectionReusableView {
    private let headerImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.rickMortyHeader)
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
}
