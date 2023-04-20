//
//  AvatarActivityIndicatorReusableViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 20/04/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarActivityIndicatorReusableViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarActivityIndicatorReusableView!

        beforeEach {
            sut = AvatarActivityIndicatorReusableView()
            sut.frame.size = CGSize(width: 375, height: 40)
            sut.show(isFetching: true)
        }

        it("has to present correct snapshot") {
            expect(sut).to(haveValidSnapshot())
        }
    }
}
