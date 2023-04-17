//
//  AvatarCellViewModel+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

@testable import RickMorty

extension AvatarCellViewModel {
    static func stub() -> AvatarCellViewModel {
        return AvatarCellViewModel(avatarImageURL: "",
                                   avatarName: "Rich",
                                   avatarStatus: "Dead",
                                   avatarSpecie: "Specie",
                                   avatarType: "Type",
                                   avatarGender: "Gender")
    }
}
