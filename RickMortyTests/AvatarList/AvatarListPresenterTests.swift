//
//  AvatarListPresenterTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarListPresenterTests: QuickSpec {
    override func spec() {
        var viewControllerSpy: AvatarListViewControllerSpy!
        var repositoryMock: AvatarListRepositoryMock!
        var sut: AvatarListPresenter!

        beforeEach {
            viewControllerSpy = AvatarListViewControllerSpy()
            repositoryMock = AvatarListRepositoryMock()
            sut = AvatarListPresenter(repository: repositoryMock,
                                      viewModel: .stub())
            sut.viewController = viewControllerSpy
        }
    }
}
