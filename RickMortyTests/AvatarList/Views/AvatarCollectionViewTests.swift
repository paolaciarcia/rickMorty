//
//  AvatarCollectionViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 27/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarCollectionViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarCollectionView!
        var dataSource: AvatarDataSource!

        beforeEach {
            dataSource = AvatarDataSource()
            sut = AvatarCollectionView(dataSource: dataSource)
            sut.frame.size = CGSize(width: 400, height: 600)
        }

        describe("shouldFetchNewItems") {
            var shouldFetchNewItemsCallCount = 0

            beforeEach {
                sut.shouldFetchNewItems = {
                    shouldFetchNewItemsCallCount += 1
                }

                dataSource.shouldFetchNewItems?()
            }

            it("has to call shouldFetchNewItems once") {
                expect(shouldFetchNewItemsCallCount) == 1
            }
        }

        describe("didSelectItem") {
            var didSelectItemCallCount = 0
            var expectedIndex: Int?

            beforeEach {
                sut.didSelectItem = { index in
                    didSelectItemCallCount += 1
                    expectedIndex = index
                }

                dataSource.didSelect?(2)
            }

            it("has to call didSelectItem once") {
                expect(didSelectItemCallCount) == 1
            }

            it("should present index equal 2") {
                expect(expectedIndex) == 2
            }
        }

        describe("show(viewModel:)") {
            beforeEach {
                let avatarListViewModel = AvatarListViewModel(cells: [.stub(), .stub(), .stub(), .stub()])
                sut.show(viewModel: avatarListViewModel)
            }

            it("has to present correct snapshot") {
                expect(sut).toEventually(haveValidSnapshot())
            }
        }
        
    }
}
