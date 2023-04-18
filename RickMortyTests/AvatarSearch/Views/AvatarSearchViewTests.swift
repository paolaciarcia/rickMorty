//
//  AvatarSearchViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 18/04/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarSearchViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarSearchView!

        beforeEach {
            sut = AvatarSearchView()
        }

        describe("#didTapFilter") {
            var didTapFilterCount = 0

            beforeEach {
                sut.didTapFilter = {
                    didTapFilterCount += 1
                }

                let button = sut.view(withId: "filterButton") as? UIButton
                button?.sendActions(for: .touchUpInside)
            }

            it("has to call didTapFilterCount at least once") {
                expect(didTapFilterCount).to(equal(1))
            }
        }

        describe("#textFieldInput") {
            var textFieldInputCount = 0
            var expectedText: String?
            
            beforeEach {
                let textField = sut.view(withId: "textFieldSearchName") as? UITextField
                textField?.text = "rick"

                sut.textFieldInput = { text in
                    textFieldInputCount += 1
                    expectedText = text
                }

                let button = sut.view(withId: "filterButton") as? UIButton
                button?.sendActions(for: .touchUpInside)
            }

            it("has to call textFieldInputCount at least once") {
                expect(textFieldInputCount).to(equal(1))
            }

            it("should set expectedText correctly") {
                expect(expectedText).to(equal("rick"))
            }
        }
    }
}
