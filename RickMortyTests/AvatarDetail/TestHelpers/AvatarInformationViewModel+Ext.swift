//
//  AvatarInformationViewModel+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//
import UIKit

@testable import RickMorty

extension AvatarInformationViewModel {
    static func stub() -> AvatarInformationViewModel {
        return AvatarInformationViewModel(avatarImage: UIImage(asset: Asset.avatarRich),
                                          name: "Voiceoverian",
                                          status: .dead,
                                          specie: "Alien",
                                          gender: "Male",
                                          type: "Parasite")
    }
}
