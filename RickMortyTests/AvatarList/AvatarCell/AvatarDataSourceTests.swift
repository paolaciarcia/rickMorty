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
            let layout = UICollectionViewFlowLayout()

            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

            viewModel = .stub()
            sut = AvatarDataSource(avatarList: viewModel)

            collectionView.dataSource = sut
        }

        describe("#UICollectionViewDataSource") {
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

        describe("#UICollectionViewDelegate") {
            describe("#didSelectItemAt") {
                var selectedIndexPathCount = 0
                var expectedIndexPath: Int?
                let indexPath = IndexPath(item: 1, section: 0)

                beforeEach {
                    sut.didSelect = { index in
                        selectedIndexPathCount += 1
                        expectedIndexPath = index
                    }

                    selectedIndexPathCount = 0
                    collectionView.delegate = sut
                    sut.collectionView(collectionView, didSelectItemAt: indexPath)
                }

                it("calls the didSelect closure with the correct value") {
                    expect(expectedIndexPath) == 1
                }

                it("has to call selectedIndexPathCount at least once") {
                    expect(selectedIndexPathCount) == 1
                }
            }
        }

        describe("#UICollectionViewDelegateFlowLayout") {
            describe("#minimumLineSpacingForSectionAt") {
                it("should return 16") {
                    let minimumLineSpacing = sut.collectionView(collectionView, layout: UICollectionViewLayout(), minimumLineSpacingForSectionAt: 0)

                    expect(minimumLineSpacing) == 16
                }
            }

            describe("#insetForSectionAt") {
                it("should return expected UIEdgeInsets") {
                    let insets = sut.collectionView(collectionView, layout: UICollectionViewLayout(), insetForSectionAt: 0)

                    expect(insets) == UIEdgeInsets(top: 10, left: 14, bottom: 14, right: 14)
                }
            }

            describe("#sizeForItemAt") {
                it("should return expected CGSize") {
                    let width = UIScreen.main.bounds.width
                    let indexPath = IndexPath(item: 1, section: 0)
                    let size = sut.collectionView(collectionView, layout: UICollectionViewLayout(), sizeForItemAt: indexPath)

                    expect(size) == CGSize(width: width * 0.44, height: 250)
                }
            }

            xdescribe("#viewForSupplementaryElementOfKind") {
                context("when the kind is elementKindSectionHeader") {
                    beforeEach {
                        collectionView.register(AvatarHeaderReusableView.self,
                                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: String(describing: AvatarHeaderReusableView.self))
                    }

                    it("returns an instance of AvatarHeaderReusableView") {
                        let indexPath = IndexPath(item: 0, section: 1)
                        let view = sut.collectionView(collectionView,
                                                      viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
                                                      at: indexPath) as? AvatarHeaderReusableView

                        expect(view).notTo(beNil())
                        expect(view).to(beAKindOf(AvatarHeaderReusableView.self))
                    }
                }

                context("when the kind is elementKindSectionFooter") {
                    it("returns an instance of AvatarActivityIndicatorReusableView") {
                        let indexPath = IndexPath(item: 0, section: 1)
                        let view = sut.collectionView(collectionView,
                                                      viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionFooter,
                                                      at: indexPath) as? AvatarActivityIndicatorReusableView

                        expect(view).notTo(beNil())
                        expect(view).to(beAKindOf(AvatarActivityIndicatorReusableView.self))
                    }
                }
            }

            describe("#referenceSizeForHeaderInSection") {
                it("should return expected CGSize") {
                    let width = UIScreen.main.bounds.width
                    let height = UIScreen.main.bounds.height
                    let size = sut.collectionView(collectionView, layout: UICollectionViewLayout(), referenceSizeForHeaderInSection: 0)

                    expect(size) == CGSize(width: width, height: height * 0.45)
                }
            }

            describe("#referenceSizeForFooterInSection") {
                context("when hasMorePages is true") {
                    it("should return expected CGSize") {
                        let width = UIScreen.main.bounds.width
                        let height = UIScreen.main.bounds.height
                        let size = sut.collectionView(collectionView, layout: UICollectionViewLayout(), referenceSizeForFooterInSection: 1)

                        expect(size) == CGSize(width: width, height: height * 0.10)
                    }
                }

                context("when hasMorePages is false") {
                    let expectedViewModel: AvatarListViewModel = .stub(hasMorePages: false)

                    beforeEach {
                        sut = AvatarDataSource(avatarList: expectedViewModel)
                        collectionView.dataSource = sut
                    }

                    it("should return expected CGSize") {
                        let width = UIScreen.main.bounds.width
                        let size = sut.collectionView(collectionView, layout: UICollectionViewLayout(), referenceSizeForFooterInSection: 0)

                        expect(size) == CGSize(width: width, height: 10)
                    }
                }
            }
        }
    }
}
