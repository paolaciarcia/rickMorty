//
//  AvatarList.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/03/23.
//

import Foundation

struct AvatarList: Decodable {
    let info: AvatarInfo
    let results: [Results]
}

struct Results: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}

struct AvatarInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
