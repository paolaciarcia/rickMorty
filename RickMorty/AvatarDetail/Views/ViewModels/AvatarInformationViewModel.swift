//
//  AvatarInformationViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import UIKit

enum Status {
    case active
    case dead
    case unknown
}

struct AvatarInformationViewModel {
    let name: String
//    var statusIcon: UIImage?
    let status: Status
    let specie: String
    let gender: String
    let type: String

    var getIcon: UIImage? {
        switch status {
        case .active:
            return UIImage(asset: Asset.activeStatus)
        case .dead:
            return UIImage(asset: Asset.activeStatus)
        case .unknown:
            return UIImage(asset: Asset.activeStatus)
        }
    }
}
