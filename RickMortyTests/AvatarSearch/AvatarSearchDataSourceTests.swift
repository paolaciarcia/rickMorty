//
//  AvatarSearchDataSourceTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 18/04/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarSearchDataSourceTests: QuickSpec {
    override func spec() {
        var sut: AvatarSearchDataSource!
        var collectionView: UICollectionView!

        beforeEach {
            let layout = UICollectionViewFlowLayout()
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            sut = AvatarSearchDataSource()
            collectionView.dataSource = sut
        }

        describe("#numberOfItemsInSection") {
            it("has to set numberOfItemsInSection equal 3") {
                let currentItemCount = sut.collectionView(collectionView, numberOfItemsInSection: 0)

                expect(currentItemCount) == 3
            }
        }

        describe("#cellForItemAt") {
            beforeEach {
                collectionView.register(AvatarSearchViewCell.self,
                                        forCellWithReuseIdentifier: String(describing: AvatarSearchViewCell.self))
            }

            it("has to set cell properties correctly") {
                let indexPath = IndexPath(item: 0, section: 0)

                let cell = sut.collectionView(collectionView, cellForItemAt: indexPath) as? AvatarSearchViewCell

                expect(cell).notTo(beNil())
                expect(cell?.isSelected) == false
                expect(cell?.backgroundColor?.cgColor) == UIColor.systemGray4.cgColor
            }
        }

        describe("#didSelectItemAt") {
            var selectedStatusCount = 0
            var expectedStatus: String?
            let indexPath = IndexPath(item: 1, section: 0)

            beforeEach {
                sut.selectedStatus = { status in
                    selectedStatusCount += 1
                    expectedStatus = status
                }

                selectedStatusCount = 0
                collectionView.delegate = sut
                sut.collectionView(collectionView, didSelectItemAt: indexPath)
            }

            it("calls the selectedStatus closure with the correct value") {
                expect(expectedStatus) == "Alive"
            }

            it("has to call selectedStatusCount at least once") {
                expect(selectedStatusCount) == 1
            }
        }
    }
}
