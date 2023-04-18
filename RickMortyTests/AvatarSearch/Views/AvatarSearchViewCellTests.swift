//
//  AvatarSearchViewCellTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 12/04/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarSearchViewCellTests: QuickSpec {
    override func spec() {
        var sut: AvatarSearchViewCell!

        beforeEach {
            sut = AvatarSearchViewCell()
            sut.frame.size = CGSize(width: 75, height: 34)
        }

        describe("#init") {
            context("when status is selected") {
                beforeEach {
                    sut.isSelected = true
                    sut.show(avatarStatus: "Dead")
                }

                it("has to present correct snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }

            context("when status is not selected") {
                beforeEach {
                    sut.isSelected = false
                    sut.show(avatarStatus: "Dead")
                }

                it("has to present correct snapshot") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
