//
//  AvatarSearchDataSource.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 03/04/23.
//

import UIKit

final class AvatarSearchDataSource: NSObject, UICollectionViewDataSource {
    var selectedStatus: ((String?) -> Void)?

    private var statusArray = ["Dead", "Alive", "Unknown"]
    private var selectedItems: [String] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        statusArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarSearchViewCell.self), for: indexPath) as? AvatarSearchViewCell else {
            return UICollectionViewCell()
        }
        let item = statusArray[indexPath.item]
        cell.show(avatarStatus: item)
        return cell
    }
}

extension AvatarSearchDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = statusArray[indexPath.item]
            selectedStatus?(item)
    }
}
