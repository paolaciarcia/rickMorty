//
//  AvatarDetailPresenterTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

import Quick
import Nimble
import UIKit

@testable import RickMorty

final class AvatarDetailPresenterTests: QuickSpec {
    override func spec() {
        var controllerSpy: AvatarDetailViewControllerSpy!
        var sut: AvatarDetailPresenter!
        var viewModel: AvatarCellViewModel!

        beforeEach {
            controllerSpy = AvatarDetailViewControllerSpy()
            viewModel = .stub()
            sut = AvatarDetailPresenter(viewModel: viewModel)

            sut.viewController = controllerSpy
        }

        describe("#loadAvatarDetail") {
            beforeEach {
                sut.loadAvatarDetail()
            }

            it("has to call howAvatarDetail(viewModel:) at least once") {
                expect(controllerSpy.showAvatarDetailCount) == 1
            }

            it("has to present viewModel parameters correctly") {
                expect(controllerSpy.expectedViewModel?.avatarImage) == viewModel.avatarImageURL
                expect(controllerSpy.expectedViewModel?.placeholderImage) == UIImage(asset: Asset.placeholderCharacter)
                expect(controllerSpy.expectedViewModel?.name) == viewModel.avatarName
                expect(controllerSpy.expectedViewModel?.status) == viewModel.avatarStatus
                expect(controllerSpy.expectedViewModel?.specie) == viewModel.avatarSpecie
                expect(controllerSpy.expectedViewModel?.gender) == viewModel.avatarGender
                expect(controllerSpy.expectedViewModel?.type) == viewModel.avatarType
            }
        }
    }
}
