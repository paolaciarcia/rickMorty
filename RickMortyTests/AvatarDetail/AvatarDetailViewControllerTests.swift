//
//  AvatarDetailViewControllerTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarDetailViewControllerTests: QuickSpec {
    override func spec() {
        var sut: AvatarDetailViewController!
        var viewSpy: AvatarDetailViewSpy!
        var presenterSpy: AvatarDetailPresenterSpy!
        var navigationController: UINavigationController!

        beforeEach {
            viewSpy = AvatarDetailViewSpy()
            presenterSpy = AvatarDetailPresenterSpy()
            navigationController = UINavigationController()
            sut = AvatarDetailViewController(contentView: viewSpy,
                                             presenter: presenterSpy)

        }

        describe("#loadView") {
            beforeEach {
                sut.loadView()
            }

            it("view has to be kind of AvatarDetailView") {
                expect(sut.view).to(beAKindOf(AvatarDetailViewType.self))
            }
        }

        describe("#viewDidLoad") {
            beforeEach {
                sut.viewDidLoad()
            }

            it("has to call loadAvatarDetail from presenter at least once") {
                expect(presenterSpy.loadAvatarDetailCount) == 1
            }
        }

        describe("#viewWillAppear") {
            beforeEach {
                sut.viewWillAppear(true)
                navigationController.applyCustomAppearence()
            }

            it("has to call correct parameters") {
                expect(sut.title) == "Character detail"
                expect(navigationController?.navigationBar.compactAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.standardAppearance.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor) == .systemGray5
                expect(navigationController?.navigationBar.tintColor) == .white
                expect(navigationController?.navigationBar.isTranslucent) == false
            }
        }

        describe("#AvatarDetailViewControllerType") {
            context("#showAvatarDetail(viewModel:)") {
                var viewModel: AvatarInformationViewModel!

                beforeEach {
                    viewModel = .stub()
                    sut.showAvatarDetail(viewModel: viewModel)
                }

                it("has to call show(viewModel:) from contentView at least once") {
                    expect(viewSpy.showCount) == 1
                    expect(viewSpy.expectedViewModel) == viewModel
                }
            }
        }
    }
}
