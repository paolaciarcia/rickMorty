//
//  AvatarListCoordinatorTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarListCoordinatorTests: QuickSpec {
    override func spec() {
        var sut: AvatarListCoordinator!
        var navigationControllerSpy: UINavigationControllerSpy!
        var filterDelegateSpy: AvatarSearchFilterDelegateSpy!

        beforeEach {
            let viewModel = AvatarListViewModel()
            filterDelegateSpy = AvatarSearchFilterDelegateSpy()
            navigationControllerSpy = UINavigationControllerSpy()
            sut = AvatarListCoordinator(navigationController: navigationControllerSpy,
                                        viewModel: viewModel)
            sut.start()
        }

        describe("#start") {
            it("has to call show once") {
                expect(navigationControllerSpy.showCallCount) == 1
            }

            it("has to set currentViewController") {
                expect(navigationControllerSpy.expectedViewController).to(beAKindOf(AvatarListViewController.self))
            }
        }

        describe("#AvatarListViewControllerDelegate") {
            context("#showAvatarDetail(with viewModel:)") {
                beforeEach {
                    sut.showAvatarDetail(with: .stub())
                }

                it("has to call pushViewController once") {
                    expect(navigationControllerSpy.pushViewControllerCallCount) == 1
                }

                it("has to set currentViewController") {
                    expect(navigationControllerSpy.expectedViewController).to(beAKindOf(AvatarDetailViewController.self))
                }
            }

            context("#openAvatarFilter(filterDelegate:)") {
                beforeEach {
                    sut.openAvatarFilter(filterDelegate: filterDelegateSpy)
                }

                it("has to call pushViewController once") {
                    expect(navigationControllerSpy.pushViewControllerCallCount) == 1
                }

                it("has to set currentViewController") {
                    expect(navigationControllerSpy.expectedViewController).to(beAKindOf(AvatarSearchViewController.self))
                }
            }
        }

        describe("#AvatarSearchViewControllerDelegate") {
            context("#showFilteredAvatar()") {
                beforeEach {
                    sut.showFilteredAvatar()
                }

                it("has to call popViewController once") {
                    expect(navigationControllerSpy.popViewControllerCallCount) == 1
                }
            }
        }
    }
}
