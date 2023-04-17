//
//  AvatarDetailViewSpy.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 17/04/23.
//

import UIKit

@testable import RickMorty

final class AvatarDetailViewSpy: UIView, AvatarDetailViewType {
    private(set) var showCount = 0
    private(set) var expectedViewModel: AvatarInformationViewModel?

    func show(viewModel: AvatarInformationViewModel) {
        showCount += 1
        expectedViewModel = viewModel
    }
}
