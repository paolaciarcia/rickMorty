//
//  AvatarList.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/03/23.
//

import Foundation

struct AvatarList: Equatable, Decodable {
    let info: AvatarInfo
    let results: [Results]
}

struct Results: Equatable, Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}

struct AvatarInfo: Equatable, Decodable {
    let pages: Int
}
