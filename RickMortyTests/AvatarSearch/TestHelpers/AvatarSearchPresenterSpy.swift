//
//  AvatarSearchPresenterSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

@testable import RickMorty

final class AvatarSearchPresenterSpy: AvatarSearchPresenterType {
    private(set) var filterAvatarNameCallCount = 0
    private(set) var expectedName: String?

    func filterAvatar(name: String?) {
        filterAvatarNameCallCount += 1
        expectedName = name
    }

    private(set) var filterAvatarStatusCallCount = 0
    private(set) var expectedStatus: String?

    func filterAvatar(status: String?) {
        filterAvatarStatusCallCount += 1
        expectedStatus = status
    }

    private(set) var filterAvatarCount = 0

    func filterAvatar() {
        filterAvatarCount += 1
    }
}
