//
//  AvatarCellViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Foundation
import UIKit

enum AvatarListState: Equatable {
    case ready(viewModel: AvatarListViewModel)
    case loading
    case error
}

struct AvatarListViewModel: Equatable {
    let cells: [AvatarCellViewModel]
    let filteredName: String = ""
    let filteredStatus: String = ""
}

struct AvatarCellViewModel: Equatable {
//    let id: Int
    let avatarImageURL: String
    let avatarName: String
    let avatarStatus: String
    let avatarSpecie: String
    let avatarType: String
    let avatarGender: String
}
