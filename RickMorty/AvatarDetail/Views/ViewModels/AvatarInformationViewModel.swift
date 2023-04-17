//
//  AvatarInformationViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

struct AvatarInformationViewModel: Equatable {
    let avatarImage: String
    let placeholderImage: UIImage?
    let name: String
    let status: String
    let specie: String
    let gender: String
    let type: String

    var getIcon: UIImage? {
        switch status {
        case L10n.alive:
            return UIImage(asset: Asset.activeStatus)
        case L10n.dead:
            return UIImage(asset: Asset.deadStatus)
        default:
            return UIImage(asset: Asset.unknownStatus)
        }
    }
}
