//
//  AvatarListViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarListViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarListView!

        beforeEach {
            sut = AvatarListView()
            sut.frame.size = CGSize(width: 400, height: 600)
        }

        describe("didSelectItem") {
            var didSelectItemCallCount = 0
            var expectedIndex: Int?

            beforeEach {
                sut.didSelectItem = { index in
                    didSelectItemCallCount += 1
                    expectedIndex = index
                }

                let view = sut.view(withId: "viewReady") as? AvatarCollectionView
                view?.didSelectItem?(2)
            }

            it("has to call didSelectItem once") {
                expect(didSelectItemCallCount) == 1
            }

            it("should present index equal 2") {
                expect(expectedIndex) == 2
            }
        }

        describe("didSelectReloadList") {
            var didSelectReloadListCallCount = 0

            beforeEach {
                sut.didSelectReloadList = {
                    didSelectReloadListCallCount += 1
                }

                let view = sut.view(withId: "viewError") as? AvatarErrorView
                view?.didSelectReloadList?()
            }

            it("has to call didSelectReloadList once") {
                expect(didSelectReloadListCallCount) == 1
            }
        }

        describe("didSelectNewSearch") {
            var didSelectNewSearchCallCount = 0

            beforeEach {
                sut.didSelectNewSearch = {
                    didSelectNewSearchCallCount += 1
                }

                let view = sut.view(withId: "viewEmptyState") as? AvatarEmptyStateView
                view?.didSelectNewSearch?()
            }

            it("has to call didSelectNewSearch once") {
                expect(didSelectNewSearchCallCount) == 1
            }
        }

        describe("fetchNewItems") {
            var fetchNewItemsCallCount = 0

            beforeEach {
                sut.fetchNewItems = {
                    fetchNewItemsCallCount += 1
                }

                let view = sut.view(withId: "viewReady") as? AvatarCollectionView
                view?.shouldFetchNewItems?()
            }

            it("has to call fetchNewItems once") {
                expect(fetchNewItemsCallCount) == 1
            }
        }

        describe("#AvatarListViewType") {
            context("#show(state: .ready)") {
                beforeEach {
                    sut.show(state: .ready(viewModel: .stub()))
                }

                it("has to present correct snapshot") {
                    expect(sut).toEventually(haveValidSnapshot())
                }
            }

            context("#show(state: .loading)") {
                beforeEach {
                    sut.show(state: .loading)
                    sut.draw(sut.bounds)
                }

                it("has to present correct snapshot") {
                    expect(sut).toAlways(haveValidSnapshot(usesDrawRect: true) )
                }
            }

            context("#show(state: .error)") {
                beforeEach {
                    sut.show(state: .error)
                }

                it("has to present correct snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }

            context("#show(state: .emptyState)") {
                beforeEach {
                    sut.show(state: .emptyState)
                }

                it("has to present correct snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
