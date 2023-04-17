//
//  AvatarDetailViewControllerSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

@testable import RickMorty

final class AvatarDetailViewControllerSpy: AvatarDetailViewControllerType {
    private(set) var showAvatarDetailCount = 0
    private(set) var expectedViewModel: AvatarInformationViewModel?

    func showAvatarDetail(viewModel: AvatarInformationViewModel) {
        showAvatarDetailCount += 1
        expectedViewModel = viewModel
    }
}
