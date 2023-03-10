//
//  AvatarCellViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

enum AvatarListState {
    case ready(viewModel: AvatarListViewModel)
    case loading
    case error
}

struct AvatarListViewModel {
    let cells: [AvatarCellViewModel]
}

struct AvatarCellViewModel {
//    let id: Int
    let avatarImageURL: String
    let avatarName: String
    let avatarStatus: String
    let avatarSpecie: String
    let avatarType: String?
    let avatarGender: String
}
