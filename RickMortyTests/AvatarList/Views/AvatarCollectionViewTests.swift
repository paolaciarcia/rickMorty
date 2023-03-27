//
//  AvatarCollectionViewTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 27/03/23.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import RickMorty

final class AvatarCollectionViewTests: QuickSpec {
    override func spec() {
        var sut: AvatarCollectionView!

        beforeEach {
            sut = AvatarCollectionView()
            sut.frame.size = CGSize(width: 375, height: 600)
        }

        describe("show(viewModel:)") {
            beforeEach {
                let viewModel = [
                    AvatarCellViewModel(avatarImageURL: "",
                                        avatarName: "Rich",
                                        avatarStatus: "Dead",
                                        avatarSpecie: "Specie",
                                        avatarType: "Type",
                                        avatarGender: "Gender"),
                    AvatarCellViewModel(avatarImageURL: "",
                                        avatarName: "Rich",
                                        avatarStatus: "Dead",
                                        avatarSpecie: "Specie",
                                        avatarType: "Type",
                                        avatarGender: "Gender"),
                    AvatarCellViewModel(avatarImageURL: "",
                                        avatarName: "Rich",
                                        avatarStatus: "Dead",
                                        avatarSpecie: "Specie",
                                        avatarType: "Type",
                                        avatarGender: "Gender"),
                    AvatarCellViewModel(avatarImageURL: "",
                                        avatarName: "Rich",
                                        avatarStatus: "Dead",
                                        avatarSpecie: "Specie",
                                        avatarType: "Type",
                                        avatarGender: "Gender")
                ]
                sut.show(viewModel: viewModel)
            }

            it("has to present correct snapshot") {
                expect(sut).toEventually(recordSnapshot())
            }
        }
        
    }
}
