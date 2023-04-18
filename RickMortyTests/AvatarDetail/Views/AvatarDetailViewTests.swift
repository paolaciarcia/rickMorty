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
            context("#show(viewModel:) when status is Dead") {
                beforeEach {
                    sut.show(viewModel: .stub())
                    sut.frame.size = CGSize(width: 375, height: 600)
                }

                it("has to present correct snapshot") {
                    expect(sut).toAlways(haveValidSnapshot())
                }
            }

            context("#show(viewModel:) when status is Alive") {
                beforeEach {
                    sut.show(viewModel: .stub(status: "Alive"))
                    sut.frame.size = CGSize(width: 375, height: 600)
                }

                it("has to present correct snapshot") {
                    expect(sut).toAlways(haveValidSnapshot())
                }
            }

            context("#show(viewModel:) when status is Unknown") {
                beforeEach {
                    sut.show(viewModel: .stub(status: "Unknown"))
                    sut.frame.size = CGSize(width: 375, height: 600)
                }

                it("has to present correct snapshot") {
                    expect(sut).toAlways(haveValidSnapshot())
                }
            }
        }
    }
}
