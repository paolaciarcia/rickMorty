//
//  AvatarListViewControllerTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

import UIKit
import Quick
import Nimble

@testable import RickMorty

final class AvatarListViewControllerTests: QuickSpec {
    override func spec() {
        var presenterSpy: AvatarListPresenterSpy!
        var delegateSpy: AvatarListViewControllerDelegateSpy!
        var viewDummy: AvatarListViewDummy!
        var navigationController: UINavigationController!
        var sut: AvatarListViewController!

        beforeEach {
            presenterSpy = AvatarListPresenterSpy()
            delegateSpy = AvatarListViewControllerDelegateSpy()
            viewDummy = AvatarListViewDummy()
            sut = AvatarListViewController(contentView: viewDummy,
                                           presenter: presenterSpy)

            navigationController = UINavigationController(rootViewController: sut)
            sut.delegate = delegateSpy
            _ = sut.view
        }

        describe("#loadView") {
            beforeEach {
                sut.loadView()
            }

            it("view has to be kind of AvatarListViewType") {
                expect(sut.view).to(beAKindOf(AvatarListViewType.self))
            }
        }

        describe("#viewDidLoad") {
            it("has to call loadAvatarList from presenter once") {
                expect(presenterSpy.loadAvatarListCallerCount) == 1
            }

            it("has to set isNavigationBarHidden equal true") {
                expect(sut.navigationController?.isNavigationBarHidden) == true
            }
        }

        describe("#viewWillAppear") {
            beforeEach {
                sut.viewWillAppear(true)
                navigationController.applyCustomAppearence()
            }

            it("has to call correct parameters") {
                expect(sut.title) == "Characters"
                expect(navigationController?.navigationBar.compactAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.standardAppearance.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.tintColor) == .white
                expect(navigationController?.navigationBar.isTranslucent) == false
                expect(navigationController.navigationItem.backBarButtonItem?.title) == nil
            }
        }

        describe("#didSelectItem") {
            let expectedItem = 1

            beforeEach {
                viewDummy.didSelectItem?(expectedItem)
            }

            it("has to call getAvatarDetail(index:) from presenter once") {
                expect(presenterSpy.getAvatarDetailCallerCount) == 1
            }

            it("has to set item properly") {
                expect(presenterSpy.expectedIndex) == expectedItem
            }
        }

        describe("#didSelectReloadList") {
            beforeEach {
                viewDummy.didSelectReloadList?()
            }

            it("has to call loadAvatarList from presenter at least once") {
                expect(presenterSpy.loadAvatarListCallerCount) == 2
            }
        }

        describe("#didSelectNewSearch") {
            beforeEach {
                viewDummy.didSelectNewSearch?()
            }

            it("has to call newSearchFromAvatarList from presenter once") {
                expect(presenterSpy.newSearchFromAvatarListCallerCount) == 1
            }
        }

        describe("#fetchNewItems") {
            beforeEach {
                viewDummy.fetchNewItems?()
            }

            it("has to call fetchMoreItems from presenter once") {
                expect(presenterSpy.fetchMoreItemsCallerCount) == 1
            }
        }

        xdescribe("#searchButtonTap") {
            beforeEach {
                sut.navigationItem.rightBarButtonItem?.simulateTap()
            }

            it("has to call openAvatarFilter(filterDelegate:) from delegate once") {
                expect(delegateSpy.openAvatarFilterCallerCount) == 1
            }
        }

        describe("#AvatarListViewControllerType") {
            describe("#show(state:)") {
                context("when state is ready") {
                    let listViewModel: AvatarListViewModel = .stub()

                    beforeEach {
                        sut.show(state: .ready(viewModel: listViewModel))
                    }

                    it("has to call show(state:) from contentView once") {
                        expect(viewDummy.showReadyStateCallerCount).toEventually(equal(1))
                    }

                    it("has to present viewModel properly") {
                        expect(viewDummy.expectedViewModel).toEventually(equal(listViewModel))
                    }

                    it("isNavigationBarHidden must be false") {
                        expect(sut.navigationController?.isNavigationBarHidden).toEventually(beFalse())
                    }
                }

                context("when state is loading") {
                    beforeEach {
                        sut.show(state: .loading)
                    }

                    it("has to call show(state:) from contentView once") {
                        expect(viewDummy.showLoadingStateCallerCount).toEventually(equal(1))
                    }

                    it("isNavigationBarHidden must be true") {
                        expect(sut.navigationController?.isNavigationBarHidden).toEventually(beTrue())
                    }
                }

                context("when state is error") {
                    beforeEach {
                        sut.show(state: .error)
                    }

                    it("has to call show(state:) from contentView once") {
                        expect(viewDummy.showErrorStateCallerCount).toEventually(equal(1))
                    }

                    it("isNavigationBarHidden must be true") {
                        expect(sut.navigationController?.isNavigationBarHidden).toEventually(beTrue())
                    }
                }

                context("when state is emptyState") {
                    beforeEach {
                        sut.show(state: .emptyState)
                    }

                    it("has to call show(state:) from contentView once") {
                        expect(viewDummy.showEmptyStateCallerCount).toEventually(equal(1))
                    }

                    it("isNavigationBarHidden must be true") {
                        expect(sut.navigationController?.isNavigationBarHidden).toEventually(beTrue())
                    }
                }
            }

            describe("redirectToAvatarDetail(with viewModel:") {
                let cellViewModel: AvatarCellViewModel = .stub()

                beforeEach {
                    sut.redirectToAvatarDetail(with: cellViewModel)
                }

                it("has to call showAvatarDetail(with:) from delegate once") {
                    expect(delegateSpy.showAvatarDetailCallerCount) == 1
                }

                it("has to set viewModel properly") {
                    expect(delegateSpy.expectedViewModel) == cellViewModel
                }
            }
        }

        describe("#AvatarSearchFilterDelegate") {
            describe("#didUpdateFilterOptions(name:, status:)") {
                let expectedName = "Rick"
                let expectedStatus = "Dead"

                beforeEach {
                    sut.didUpdateFilterOptions(name: expectedName, status: expectedStatus)
                }

                it("has to call updateFilterOptions(name:, status:) from presenter once") {
                    expect(presenterSpy.updateFilterOptionsCallerCount) == 1
                }

                it("has to set parameters correclty") {
                    expect(presenterSpy.expectedName) == expectedName
                    expect(presenterSpy.expectedStatus) == expectedStatus
                }
            }
        }
    }
}
