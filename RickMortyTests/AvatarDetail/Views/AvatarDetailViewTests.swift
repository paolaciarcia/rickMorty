//
//  AvatarDetailViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarDetailViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarDetailView!

        beforeEach {
            sut = AvatarDetailView()
        }

        describe("#AvatarInformationViewType") {
            context("#show(viewModel:)") {
                beforeEach {
                    sut.show(viewModel: .stub())
                    sut.frame.size = CGSize(width: 375, height: 600)
                }

                it("has to present correct snapshot") {
                    expect(sut).toAlways(haveValidSnapshot())
                }
            }
        }
    }
}
