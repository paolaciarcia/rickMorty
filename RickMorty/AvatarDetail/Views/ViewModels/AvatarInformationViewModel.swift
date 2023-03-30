//
//  AvatarInformationViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

enum Status: String {
    case active
    case dead
    case unknown
}

struct AvatarInformationViewModel {
    let avatarImage: String
    let name: String
    let status: String
    let specie: String
    let gender: String
    let type: String

    var getIcon: UIImage? {
        switch status {
        case "Alive":
            return UIImage(asset: Asset.activeStatus)
        case "Dead":
            return UIImage(asset: Asset.deadStatus)
        default:
            return UIImage(asset: Asset.unknownStatus)
        }
    }
}
