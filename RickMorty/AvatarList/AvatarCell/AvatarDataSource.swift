//
//  AvatarDataSource.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

final class AvatarDataSource: NSObject, UICollectionViewDataSource {
    var didSelect: ((Int) -> Void)?

    private var avatarList: [AvatarCellViewModel]

    init(avatarList: [AvatarCellViewModel] = []) {
        self.avatarList = avatarList
    }

    func setupAvatarList(avatarList: [AvatarCellViewModel]) {
        self.avatarList = avatarList
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatarList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarViewCell.self), for: indexPath) as? AvatarViewCell else {
            return UICollectionViewCell()
        }

        cell.show(viewModel: avatarList[indexPath.item])
        return cell
    }
}

extension AvatarDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(indexPath.item)
    }
}
