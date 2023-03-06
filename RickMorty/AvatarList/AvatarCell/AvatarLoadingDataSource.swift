//
//  AvatarLoadingDataSource.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarLoadingDataSource: NSObject, UICollectionViewDataSource {
    private let avatarList: [AvatarCellViewModel]

    init(avatarList: [AvatarCellViewModel]) {
        self.avatarList = avatarList
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatarList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarLoadingViewCell.self),
                                                            for: indexPath) as? AvatarLoadingViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
