//
//  AvatarListViewControllerDelegateSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

@testable import  RickMorty

final class AvatarListViewControllerDelegateSpy: AvatarListViewControllerDelegate {

    private(set) var showAvatarDetailCallerCount = 0
    private(set) var expectedViewModel: AvatarCellViewModel?

    func showAvatarDetail(with viewModel: AvatarCellViewModel) {
        showAvatarDetailCallerCount += 1
        expectedViewModel = viewModel
    }

    private(set) var openAvatarFilterCallerCount = 0
    private(set) var expectedFilterDelegate: AvatarSearchFilterDelegate?

    func openAvatarFilter(filterDelegate: AvatarSearchFilterDelegate) {
        openAvatarFilterCallerCount += 1
        expectedFilterDelegate = filterDelegate
    }
}
