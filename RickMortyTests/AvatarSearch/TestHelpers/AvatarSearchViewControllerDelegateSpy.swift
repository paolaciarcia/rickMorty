//
//  AvatarSearchViewControllerDelegateSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

@testable import RickMorty

final class AvatarSearchViewControllerDelegateSpy: AvatarSearchViewControllerDelegate {
    private(set) var showFilteredAvatarCallCount = 0

    func showFilteredAvatar() {
        showFilteredAvatarCallCount += 1
    }
}
