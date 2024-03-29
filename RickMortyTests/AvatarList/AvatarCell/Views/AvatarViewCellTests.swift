//
//  AvatarViewCellTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 06/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarViewCellTests: QuickSpec {
    override func spec() {
        var sut: AvatarViewCell!

        beforeEach {
            sut = AvatarViewCell()
            sut.frame.size = CGSize(width: 186, height: 244)
        }

        describe("#init") {
            beforeEach {
                sut.show(viewModel: .stub())
            }
            it("has to present correct snapshot") {
                expect(sut).toAlways(haveValidSnapshot())
            }
        }
    }
}
