//
//  AvatarDetailView.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

final class AvatarDetailView: UIView {
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        view.layer.borderWidth = 3
        view.layer.borderColor = CGColor(red: 48, green: 209, blue: 88, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let informationView = AvatarInformationView()
    
    
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
