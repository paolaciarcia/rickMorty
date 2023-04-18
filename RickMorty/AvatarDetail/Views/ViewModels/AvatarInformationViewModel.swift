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
    
    var getStatusColor: CGColor {
        switch status {
        case L10n.alive:
            return CGColor(red: 122.0/255.0,
                           green: 182.0/255.0,
                           blue: 59.0/255.0,
                           alpha: 1.0)
        case L10n.dead:
            return CGColor(red: 255.0/255.0,
                           green: 59.0/255.0,
                           blue: 48.0/255.0,
                           alpha: 1.0)
        default:
            return CGColor(red: 151.0/255.0,
                           green: 151.0/255.0,
                           blue: 151.0/255.0,
                           alpha: 1.0)
        }
    }
}
