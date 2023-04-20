//
//  AvatarHeaderReusableViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarHeaderReusableViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarHeaderReusableView!

        beforeEach {
            sut = AvatarHeaderReusableView()
            sut.frame.size = CGSize(width: 375, height: 300)
        }

        it("has to present correct snapshot") {
            expect(sut).to(haveValidSnapshot())
        }
    }
}
