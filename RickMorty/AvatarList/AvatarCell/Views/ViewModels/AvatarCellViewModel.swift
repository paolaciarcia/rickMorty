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
    let avatarImage: UIImage?
    let avatarName: String
}
