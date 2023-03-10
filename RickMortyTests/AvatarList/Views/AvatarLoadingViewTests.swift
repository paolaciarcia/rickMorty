//
//  AvatarLoadingViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarLoadingViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarLoadingView!

        beforeEach {
            sut = AvatarLoadingView()
            sut.frame.size = CGSize(width: 375, height: 600)
        }

        describe("#init") {
            it("has to present correct snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
