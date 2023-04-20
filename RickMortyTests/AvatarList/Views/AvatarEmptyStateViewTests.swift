//
//  AvatarEmptyStateViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarEmptyStateViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarEmptyStateView!

        beforeEach {
            sut = AvatarEmptyStateView()
            sut.frame.size = CGSize(width: 375, height: 600)
        }

        describe("didSelectNewSearch") {
            var didSelectNewSearchCallCount = 0

            beforeEach {
                sut.didSelectNewSearch = {
                    didSelectNewSearchCallCount += 1
                }

                let button = sut.view(withId: "newSearchButton") as? UIButton
                button?.sendActions(for: .touchUpInside)
            }

            it("has to call didSelectNewSearchCallCount at least once") {
                expect(didSelectNewSearchCallCount) == 1
            }
        }
    }
}
