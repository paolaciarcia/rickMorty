//
//  AvatarListViewDummy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//
import UIKit

@testable import RickMorty

final class AvatarListViewDummy: UIView, AvatarListViewType {
    var didSelectItem: ((Int) -> Void)?
    var didSelectReloadList: (() -> Void)?
    var didSelectNewSearch: (() -> Void)?
    var fetchNewItems: (() -> Void)?

    private(set) var showReadyStateCallerCount = 0
    private(set) var showLoadingStateCallerCount = 0
    private(set) var showErrorStateCallerCount = 0
    private(set) var showEmptyStateCallerCount = 0

    private(set) var expectedViewModel: AvatarListViewModel?
    
    func show(state: AvatarListState) {
        switch state {
        case .ready(let viewModel):
            showReadyStateCallerCount += 1
            expectedViewModel = viewModel
        case .loading:
            showLoadingStateCallerCount += 1
        case .error:
            showErrorStateCallerCount += 1
        case .emptyState:
            showEmptyStateCallerCount += 1
        }
    }
}
