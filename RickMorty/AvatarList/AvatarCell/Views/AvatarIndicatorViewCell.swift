//
//  AvatarIndicatorViewCell.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/04/23.
//

import UIKit

final class IndicatorCell: UICollectionViewCell {

    private var inidicatorView : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        contentView.addSubview(inidicatorView)
        inidicatorView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        inidicatorView.startAnimating()
    }
}
