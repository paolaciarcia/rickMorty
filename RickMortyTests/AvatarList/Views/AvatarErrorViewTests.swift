//
//  AvatarErrorViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarErrorViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarErrorView!

        beforeEach {
            sut = AvatarErrorView()
            sut.frame.size = CGSize(width: 375, height: 600)
        }

        describe("#init") {
            it("has to present correct snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }

        describe("#didSelectReloadList") {
            var hasTappedButtonCount = 0

            beforeEach {
                sut.didSelectReloadList = {
                    hasTappedButtonCount += 1
                }
                let button = sut.view(withId: "reloadButton") as? UIButton
                button?.sendActions(for: .touchUpInside)
            }

            it("has to call hasTappedButtonCount at least once") {
                expect(hasTappedButtonCount).to(equal(1))
            }
        }
    }
}
