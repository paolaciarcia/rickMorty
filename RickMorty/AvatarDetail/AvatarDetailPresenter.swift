//
//  AvatarDetailPresenter.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 30/03/23.
//

import UIKit

final class AvatarDetailPresenter: AvatarDetailPresenterType {
    weak var viewController: AvatarDetailViewControllerType?

    private let viewModel: AvatarCellViewModel

    init(viewModel: AvatarCellViewModel) {
        self.viewModel = viewModel
    }

    func loadAvatarDetail() {
        let informationViewModel = adaptViewModels()
        viewController?.showAvatarDetail(viewModel: informationViewModel)
    }

    private func adaptViewModels() -> AvatarInformationViewModel {
        return AvatarInformationViewModel(avatarImage: viewModel.avatarImageURL,
                                          placeholderImage: UIImage(asset: Asset.placeholderCharacter),
                                          name: viewModel.avatarName,
                                          status: viewModel.avatarStatus,
                                          specie: viewModel.avatarSpecie,
                                          gender: viewModel.avatarGender,
                                          type: viewModel.avatarType)
    }
}
