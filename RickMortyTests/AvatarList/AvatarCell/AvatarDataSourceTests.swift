//
//  AvatarDataSourceTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarDataSourceTests: QuickSpec {
    override func spec() {
        var viewModel: AvatarListViewModel!
        var collectionView: UICollectionView!
        var sut: AvatarDataSource!

        beforeEach {
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

            viewModel = .stub()
            sut = AvatarDataSource(avatarList: viewModel)

            collectionView.dataSource = sut
        }

        describe("#setupAvatarList(avatarList:)") {
            beforeEach {

                sut.setupAvatarList(avatarList: viewModel)
            }

            it("avatarList has to be a kind of AvatarListViewModel") {
                expect(viewModel).to(beAKindOf(AvatarListViewModel.self))
            }
        }

        describe("#numberOfSections") {
            it("should return 1") {
                let numberOfSections = sut.numberOfSections(in: collectionView)

                expect(numberOfSections) == 1
            }
        }

        describe("#numberOfItemsInSection") {
            it("has to set numberOfItemsInSection equal 4") {
                let currentItemCount = sut.collectionView(collectionView, numberOfItemsInSection: 0)

                expect(currentItemCount) == 4
            }
        }

        describe("#cellForItemAt") {
            context("when cell is kind of AvatarViewCell") {
                beforeEach {
                    collectionView.register(AvatarViewCell.self,
                                            forCellWithReuseIdentifier: String(describing: AvatarViewCell.self))
                }

                it("has to set cell properties correctly") {
                    let indexPath = IndexPath(item: 0, section: 0)

                    let cell = sut.collectionView(collectionView, cellForItemAt: indexPath) as? AvatarViewCell

                    let cellViewModel: AvatarCellViewModel = .stub()

                    cell?.show(viewModel: cellViewModel)

                    expect(cell).notTo(beNil())
                    expect(cellViewModel.avatarName) == "Rich"
                    expect(cellViewModel.avatarImageURL) == ""
                }
            }
        }

        describe("#willDisplay") {
            context("when indexPath is equal avatarList.cells.count - 1 and hasMorePages is true") {
                var callShouldFetchNewItemsCount = 0

                beforeEach {
                    sut.shouldFetchNewItems = {
                        callShouldFetchNewItemsCount += 1
                    }

                    let indexPath = IndexPath(item: 3, section: 1)
                    sut.collectionView(collectionView, willDisplay: UICollectionViewCell(), forItemAt: indexPath)
                }

                it("has to call shouldFetchNewItems") {
                    expect(callShouldFetchNewItemsCount) == 1
                }
            }

            context("when indexPath is not equal avatarList.cells.count - 1 and hasMorePages is true") {
                var callShouldFetchNewItemsCount = 0

                beforeEach {
                    sut.shouldFetchNewItems = {
                        callShouldFetchNewItemsCount += 1
                    }

                    let indexPath = IndexPath(item: 2, section: 1)
                    sut.collectionView(collectionView, willDisplay: UICollectionViewCell(), forItemAt: indexPath)
                }

                it("has to call shouldFetchNewItems") {
                    expect(callShouldFetchNewItemsCount) == 0
                }
            }

            context("when indexPath is equal avatarList.cells.count - 1 and hasMorePages is false") {
                let indexPath = IndexPath(item: 3, section: 1)
                let expectedViewModel: AvatarListViewModel = .stub(hasMorePages: false)

                var callShouldFetchNewItemsCount = 0

                beforeEach {
                    sut = AvatarDataSource(avatarList: expectedViewModel)
                    collectionView.dataSource = sut

                    sut.shouldFetchNewItems = {
                        callShouldFetchNewItemsCount += 1
                    }
                    sut.collectionView(collectionView, willDisplay: UICollectionViewCell(), forItemAt: indexPath)
                }

                it("has to call shouldFetchNewItems") {
                    expect(callShouldFetchNewItemsCount) == 0
                }
            }

            context("when indexPath not is equal avatarList.cells.count - 1 and hasMorePages is false") {
                let indexPath = IndexPath(item: 2, section: 1)
                let expectedViewModel: AvatarListViewModel = .stub(hasMorePages: false)

                var callShouldFetchNewItemsCount = 0

                beforeEach {
                    sut = AvatarDataSource(avatarList: expectedViewModel)
                    collectionView.dataSource = sut

                    sut.shouldFetchNewItems = {
                        callShouldFetchNewItemsCount += 1
                    }
                    sut.collectionView(collectionView, willDisplay: UICollectionViewCell(), forItemAt: indexPath)
                }

                it("has to call shouldFetchNewItems") {
                    expect(callShouldFetchNewItemsCount) == 0
                }
            }
        }
    }
}
