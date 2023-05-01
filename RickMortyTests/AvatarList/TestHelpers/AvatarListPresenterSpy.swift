//
//  AvatarListPresenterSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

@testable import RickMorty

final class AvatarListPresenterSpy: AvatarListPresenterType {
    var viewController: AvatarListViewControllerType?

    private(set) var loadAvatarListCallerCount = 0

    func loadAvatarList() {
        loadAvatarListCallerCount += 1
    }

    private(set) var getAvatarDetailCallerCount = 0
    private(set) var expectedIndex: Int?

    func getAvatarDetail(index: Int) {
        getAvatarDetailCallerCount += 1
        expectedIndex = index
    }

    private(set) var updateFilterOptionsCallerCount = 0
    private(set) var expectedName: String?
    private(set) var expectedStatus: String?

    func updateFilterOptions(name: String, status: String) {
        updateFilterOptionsCallerCount += 1
        expectedName = name
        expectedStatus = status
    }

    private(set) var fetchMoreItemsCallerCount = 0

    func fetchMoreItems() {
        fetchMoreItemsCallerCount += 1
    }

    private(set) var newSearchFromAvatarListCallerCount = 0

    func newSearchFromAvatarList() {
        newSearchFromAvatarListCallerCount += 1
    }
}
