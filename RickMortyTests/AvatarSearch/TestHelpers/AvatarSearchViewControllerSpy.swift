//
//  AvatarSearchViewControllerSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

@testable import RickMorty

final class AvatarSearchViewControllerSpy: AvatarSearchViewControllerType {
    private(set) var filterAvatarCallCount = 0
    private(set) var expectedName: String?
    private(set) var expectedStatus: String?

    func filterAvatar(name: String, status: String) {
        filterAvatarCallCount += 1
        expectedName = name
        expectedStatus = status
    }
}
