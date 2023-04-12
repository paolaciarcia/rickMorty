//
//  AvatarSearchViewModel.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 31/03/23.
//

import Foundation

struct AvatarSearchViewModel {
    let name: String
    let status: [StatusCellViewModel]
}

struct StatusCellViewModel {
    let statusDescription: String
}
