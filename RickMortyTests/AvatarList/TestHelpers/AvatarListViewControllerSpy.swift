//
//  AvatarListViewControllerSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

@testable import RickMorty

final class AvatarListViewControllerSpy: AvatarListViewControllerType {

    private(set) var showReadyStateCallerCount = 0
    private(set) var showLoadingStateCallerCount = 0
    private(set) var showErrorStateCallerCount = 0
    private(set) var showEmptyStateCallerCount = 0
    private(set) var expectedAvatarListViewModel: AvatarListViewModel?

    func show(state: AvatarListState) {
        switch state {
        case .ready(let viewModel):
            showReadyStateCallerCount += 1
            expectedAvatarListViewModel = viewModel
        case .loading:
            showLoadingStateCallerCount += 1
        case .error:
            showErrorStateCallerCount += 1
        case .emptyState:
            showEmptyStateCallerCount += 1
        }
    }

    private(set) var redirectToAvatarDetailCallerCount = 0
    private(set) var expectedCellViewModel: AvatarCellViewModel?

    func redirectToAvatarDetail(with viewModel: AvatarCellViewModel) {
        redirectToAvatarDetailCallerCount += 1
        expectedCellViewModel = viewModel
    }
}
