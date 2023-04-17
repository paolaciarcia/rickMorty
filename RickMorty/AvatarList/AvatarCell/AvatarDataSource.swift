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
    var shouldFetchNewItems: (() -> Void)?

    private var avatarList: AvatarListViewModel

    init(avatarList: AvatarListViewModel = AvatarListViewModel()) {
        self.avatarList = avatarList
    }

    func setupAvatarList(avatarList: AvatarListViewModel) {
        self.avatarList = avatarList
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatarList.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AvatarViewCell.self), for: indexPath) as? AvatarViewCell else {
                return UICollectionViewCell()
            }

        cell.show(viewModel: avatarList.cells[indexPath.item])
            return cell
        }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.item == avatarList.cells.count - 1 && avatarList.hasMorePages else { return }
        shouldFetchNewItems?()
    }
}

extension AvatarDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(indexPath.item)
    }
}

extension AvatarDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 14, bottom: 14, right: 14)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width * 0.44, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: String(describing: AvatarHeaderReusableView.self),
                                                                               for: indexPath) as? AvatarHeaderReusableView else {
                return UICollectionReusableView()
            }
            return header

        } else if kind == UICollectionView.elementKindSectionFooter {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: String(describing: AvatarIndicatorReusableView.self),
                                                                               for: indexPath) as? AvatarIndicatorReusableView else {
                return UICollectionReusableView()
            }

            footer.show(isFetching: avatarList.isFetching)
            return footer
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        return CGSize(width: width, height: height * 0.45)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height

        guard avatarList.hasMorePages else {
            return CGSize(width: width, height: 10)
        }

        return CGSize(width: width, height: height * 0.10)
    }
}
