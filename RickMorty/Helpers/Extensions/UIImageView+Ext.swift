//
//  UIImageView+Ext.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import UIKit

extension UIImageView {
    func downloadImage(url: String,
                       placeholderImage: UIImage? = nil) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: url),
            let data = try? Data(contentsOf: url),
            let downloadedImage = UIImage(data: data) else {
                self?.setImage(placeholderImage)
                return
            }
            self?.setImage(downloadedImage)
        }
    }

    private func setImage(_ image: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.image = image
        }
    }
}
