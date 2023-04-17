//
//  AvatarDetailPresenterSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

@testable import RickMorty

final class AvatarDetailPresenterSpy: AvatarDetailPresenterType {
    private(set) var loadAvatarDetailCount = 0

    func loadAvatarDetail() {
        loadAvatarDetailCount += 1
    }
}
