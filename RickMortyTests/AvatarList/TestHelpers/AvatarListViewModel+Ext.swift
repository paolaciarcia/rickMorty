//
//  AvatarListViewModel+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

@testable import RickMorty

extension AvatarListViewModel {
    static func stub() -> AvatarListViewModel {
        return AvatarListViewModel(cells: [.stub(),
                                           .stub(),
                                           .stub(),
                                           .stub()])
    }
}
