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
    let avatarImage: UIImage?
    let name: String
    let status: Status
    let specie: String
    let gender: String
    let type: String

    var getIcon: UIImage? {
        switch status {
        case .active:
            return UIImage(asset: Asset.activeStatus)
        case .dead:
            return UIImage(asset: Asset.deadStatus)
        case .unknown:
            return UIImage(asset: Asset.unknownStatus)
        }
    }

    var getAvatarStatus: String {
        switch status {
        case .active:
            return "Ativo"
        case .dead:
            return "Morto"
        case .unknown:
            return "Desconhecido"
        }
    }
}
