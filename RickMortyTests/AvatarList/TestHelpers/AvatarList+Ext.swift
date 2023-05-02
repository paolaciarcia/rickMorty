//
//  AvatarList+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

@testable import RickMorty

extension AvatarList: Equatable, Decodable {
    static func stub(totalPages: Int = 4) -> AvatarList {
        let info = AvatarInfo(pages: totalPages)
        let result = Results(name: "Rich",
                             status: "Dead",
                             species: "Specie",
                             type: "Type",
                             gender: "Gender",
                             image: "")
        
        return AvatarList(info: info,
                          results: [result, result, result, result])
    }
}
