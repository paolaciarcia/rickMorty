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
        var viewModel: AvatarListViewModel!
        var sut: AvatarListPresenter!

        beforeEach {
            viewControllerSpy = AvatarListViewControllerSpy()
            repositoryMock = AvatarListRepositoryMock()
            viewModel = .stub()
            sut = AvatarListPresenter(repository: repositoryMock,
                                      viewModel: viewModel)
            sut.viewController = viewControllerSpy
        }

        describe("#fetchMoreItems") {
            context("when viewModel hasMorePages is true") {
                beforeEach {
                    stubSuccessAvatarRequest()
                    sut.fetchMoreItems()
                }

                it("must set isFetching to true") {
                    expect(viewModel.isFetching) == true
                }

                it("has to call show(state:) from viewController once") {
                    expect(viewControllerSpy.showReadyStateCallerCount) == 1
                }
            }

            context("when viewModel hasMorePages is false") {
                let viewModelStub: AvatarListViewModel = .stub(isFetching: false,
                                                               hasMorePages: false)

                beforeEach {
                    sut = AvatarListPresenter(repository: repositoryMock,
                                              viewModel: viewModelStub)
                    sut.viewController = viewControllerSpy

                    stubSuccessAvatarRequest(totalPages: 0)
                    sut.loadAvatarList()
                    sut.fetchMoreItems()
                }

                it("must set isFetching to false") {
                    expect(viewModelStub.isFetching) == false
                }

                it("has to call show(state:) from viewController once") {
                    expect(viewControllerSpy.showReadyStateCallerCount) == 2
                }

                it("has to present expected viewModel") {
                    expect(viewControllerSpy.expectedAvatarListViewModel) == viewModelStub
                }
            }
        }

        describe("#loadAvatarList") {
            context("when request succeed") {
                beforeEach {
                    stubSuccessAvatarRequest()
                    sut.loadAvatarList()
                }

                it("has to call show(state: .loading) from viewController") {
                    expect(viewControllerSpy.showLoadingStateCallerCount) == 1
                }

                it("has to call show(state: .ready) from viewController") {
                    expect(viewControllerSpy.showReadyStateCallerCount) == 1
                }

                it("should not call show(state: .error) from viewController") {
                    expect(viewControllerSpy.showErrorStateCallerCount) == 0
                }

                it("has to set parameters properly") {
                    expect(viewModel.cells[0].avatarName) == "Rich"
                    expect(viewModel.cells[0].avatarStatus) == "Dead"
                    expect(viewModel.cells[0].avatarSpecie) == "Specie"
                    expect(viewModel.cells[0].avatarType) == "Type"
                    expect(viewModel.cells[0].avatarGender) == "Gender"
                    expect(viewModel.cells[0].avatarImageURL) == ""
                }
            }

            context("when request faiure is notFound") {
                beforeEach {
                    stubNotFoundAvatarRequest()
                    sut.loadAvatarList()
                }

                it("has to call show(state: .loading) from viewController") {
                    expect(viewControllerSpy.showLoadingStateCallerCount) == 1
                }

                it("should not call show(state: .emptyState) from viewController") {
                    expect(viewControllerSpy.showEmptyStateCallerCount) == 1
                }

                it("should not call show(state: .ready) from viewController") {
                    expect(viewControllerSpy.showReadyStateCallerCount) == 0
                }
            }

            context("when request faiure") {
                beforeEach {
                    stubFailureAvatarRequest()
                    sut.loadAvatarList()
                }

                it("has to call show(state: .loading) from viewController") {
                    expect(viewControllerSpy.showLoadingStateCallerCount) == 1
                }

                it("should not call show(state: .error) from viewController") {
                    expect(viewControllerSpy.showErrorStateCallerCount) == 1
                }

                it("should not call show(state: .ready) from viewController") {
                    expect(viewControllerSpy.showReadyStateCallerCount) == 0
                }
            }
        }

        describe("#newSearchFromAvatarList") {
            beforeEach {
                sut.newSearchFromAvatarList()
            }

            it("filteredName string from viewModel must be empty") {
                expect(viewModel.filteredName) == ""
            }

            it("filteredStatus string from viewModel must be empty") {
                expect(viewModel.filteredStatus) == ""
            }
        }

        describe("getAvatarDetail(index:)") {
            let cellViewModel: AvatarCellViewModel = .stub()

            beforeEach {
                sut.getAvatarDetail(index: 0)
            }

            it("has to call redirectToAvatarDetail(with:) from viewController once") {
                expect(viewControllerSpy.redirectToAvatarDetailCallerCount) == 1
            }

            it("has to set expcted cellViewModel") {
                expect(viewControllerSpy.expectedCellViewModel) == cellViewModel
            }
        }

        describe("#updateFilterOptions(name:, status:)") {
            beforeEach {
                stubSuccessAvatarRequest()
                sut.updateFilterOptions(name: "Rick", status: "Dead")
            }

            it("filteredName string from viewModel must be Rick") {
                expect(repositoryMock.expectedName) == "Rick"
            }

            it("filteredStatus string from viewModel must be Dead") {
                expect(repositoryMock.expectedStatus) == "Dead"
            }
        }

        func stubSuccessAvatarRequest(totalPages: Int = 4) {
            let info = AvatarInfo(pages: totalPages)
            let result = Results(name: "Rich",
                                 status: "Dead",
                                 species: "Specie",
                                 type: "Type",
                                 gender: "Gender",
                                 image: "")

            let avatarList = AvatarList(info: info,
                                        results: [result, result, result, result])
            repositoryMock.expectedResult = .success(avatarList)
        }

        func stubFailureAvatarRequest() {
            repositoryMock.expectedResult = .failure(.decodeFailure)
        }

        func stubNotFoundAvatarRequest() {
            repositoryMock.expectedResult = .failure(.notFound)
        }
    }
}
