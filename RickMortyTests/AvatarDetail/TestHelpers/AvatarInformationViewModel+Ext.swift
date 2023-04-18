//
//  AvatarInformationViewModel+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//
import UIKit

@testable import RickMorty

extension AvatarInformationViewModel {
    static func stub(status: String = "Dead") -> AvatarInformationViewModel {
        return AvatarInformationViewModel(avatarImage: "",
                                          placeholderImage: UIImage(asset: Asset.placeholderCharacter),
                                          name: "Voiceoverian",
                                          status: status,
                                          specie: "Alien",
                                          gender: "Male",
                                          type: "Parasite")
    }
}
