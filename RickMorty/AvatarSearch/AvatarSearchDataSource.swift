//
//  AvatarSearchDataSource.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 03/04/23.
//

import UIKit

final class AvatarSearchDataSource: NSObject, UICollectionViewDataSource {
    var statusIsSelected: ((Bool) -> Void)?

    private let statusArray: [StatusCellViewModel]

    init(statusArray: [StatusCellViewModel] = []) {
        self.statusArray = statusArray
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        statusArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarSearchViewCell.self), for: indexPath) as? AvatarSearchViewCell else {
            return UICollectionViewCell()
        }
        cell.show(viewModel: statusArray[indexPath.row])
        return cell
    }
}

extension AvatarSearchDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
