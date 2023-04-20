//
//  AvatarSearchPresenterTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 18/04/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarSearchPresenterTests: QuickSpec {
    override func spec() {
        var viewControllerSpy: AvatarSearchViewControllerSpy!
        var sut: AvatarSearchPresenter!

        beforeEach {
            viewControllerSpy = AvatarSearchViewControllerSpy()
            sut = AvatarSearchPresenter()

            sut.viewController = viewControllerSpy
        }

        describe("#filterAvatar") {
            let name: String? = "rick"
            let status: String? = "dead"

            beforeEach {
                sut.filterAvatar(name: name)
                sut.filterAvatar(status: status)
                sut.filterAvatar()
            }

            it("has to call filterAvatar(name:, status:) once") {
                expect(viewControllerSpy.filterAvatarCallCount) == 1
            }

            it("should set parameters correclty") {
                expect(viewControllerSpy.expectedName) == name
                expect(viewControllerSpy.expectedStatus) == status
            }
        }
    }
}
