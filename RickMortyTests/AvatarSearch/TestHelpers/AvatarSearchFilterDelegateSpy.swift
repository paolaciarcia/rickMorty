//
//  AvatarSearchFilterDelegateSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

@testable import RickMorty

final class AvatarSearchFilterDelegateSpy: AvatarSearchFilterDelegate {
    private(set) var didUpdateFilterOptionsCallCount = 0
    private(set) var expectedName: String?
    private(set) var expectedStatus: String?

    func didUpdateFilterOptions(name: String, status: String) {
        didUpdateFilterOptionsCallCount += 1
        expectedName = name
        expectedStatus = status
    }
}
