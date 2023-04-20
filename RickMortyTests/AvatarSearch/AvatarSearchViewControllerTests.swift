//
//  AvatarSearchViewControllerTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 18/04/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarSearchViewControllerTests: QuickSpec {
    override func spec() {
        var view: AvatarSearchView!
        var presenterSpy: AvatarSearchPresenterSpy!
        var delegateSpy: AvatarSearchViewControllerDelegateSpy!
        var filterDelegateSpy: AvatarSearchFilterDelegateSpy!
        var navigationController: UINavigationController!

        var sut: AvatarSearchViewController!

        beforeEach {
            view = AvatarSearchView()
            presenterSpy = AvatarSearchPresenterSpy()
            delegateSpy = AvatarSearchViewControllerDelegateSpy()
            filterDelegateSpy = AvatarSearchFilterDelegateSpy()
            navigationController = UINavigationController()

            sut = AvatarSearchViewController(contentView: view,
                                             presenter: presenterSpy)

            sut.delegate = delegateSpy
            sut.filterDelegate = filterDelegateSpy
            _ = sut.view
        }

        describe("#loadView") {
            beforeEach {
                sut.loadView()
            }

            it("view has to be a kind of AvatarSearchView") {
                expect(sut.view).to(beAKindOf(AvatarSearchView.self))
            }
        }

        describe("#viewWillAppear") {
            beforeEach {
                sut.viewWillAppear(true)
                navigationController.applyCustomAppearence()
            }

            it("has to set navigationController properties correctly") {
                expect(sut.title) == "Filters"
                expect(navigationController?.navigationBar.compactAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.standardAppearance.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.tintColor) == .white
                expect(navigationController?.navigationBar.isTranslucent) == false
            }
        }

        describe("#bindLayoutEvents") {
            context("textFieldInput") {
                let name: String? = "rick"

                beforeEach {
                    view.textFieldInput?(name)
                }

                it("has to call filterAvatar(name:) from presenter at least once") {
                    expect(presenterSpy.filterAvatarNameCallCount) == 1
                }

                it("should set expected name") {
                    expect(presenterSpy.expectedName) == name
                }
            }

            context("selectedStatus") {
                let status: String? = "dead"

                beforeEach {
                    view.selectedStatus?(status)
                }

                it("has to call filterAvatar(status:) from presenter at least once") {
                    expect(presenterSpy.filterAvatarStatusCallCount) == 1
                }

                it("should set expected status") {
                    expect(presenterSpy.expectedStatus) == status
                }
            }

            context("selectedStatus") {
                beforeEach {
                    view.didTapFilter?()
                }

                it("has to call filterAvatar(status:) from presenter at least once") {
                    expect(presenterSpy.filterAvatarCount) == 1
                }
            }
        }

        describe("#AvatarSearchViewControllerType") {
            context("#filterAvatar(name:, status:)") {
                let name: String = "rick"
                let status: String = "dead"

                beforeEach {
                    sut.filterAvatar(name: name, status: status)
                }

                it("has to call showFilteredAvatar from delegate once") {
                    expect(delegateSpy.showFilteredAvatarCallCount) == 1
                }

                it("has to call didUpdateFilterOptions(name:, status: from filterDelegate once") {
                    expect(filterDelegateSpy.didUpdateFilterOptionsCallCount) == 1
                }

                it("should set parameters correclty") {
                    expect(filterDelegateSpy.expectedName) == name
                    expect(filterDelegateSpy.expectedStatus) == status
                }
            }
        }
    }
}
