//
//  AvatarListViewControllerTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarListViewControllerTests: QuickSpec {
    override func spec() {
        var presenterSpy: AvatarListPresenterSpy!
        var delegateSpy: AvatarListViewControllerDelegateSpy!
        var viewDummy: AvatarListViewDummy!
        var sut: AvatarListViewController!

        beforeEach {
            presenterSpy = AvatarListPresenterSpy()
            delegateSpy = AvatarListViewControllerDelegateSpy()
            viewDummy = AvatarListViewDummy()
            sut = AvatarListViewController(contentView: viewDummy,
                                           presenter: presenterSpy)
            sut.delegate = delegateSpy
        }
    }
}
