//
//  AvatarDetailPresenter.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 30/03/23.
//

import Foundation

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
                                          name: viewModel.avatarName,
                                          status: viewModel.avatarStatus,
                                          specie: viewModel.avatarSpecie,
                                          gender: viewModel.avatarGender,
                                          type: viewModel.avatarType)
    }

//    private func adaptStatus() -> Status {
//        var status = Status.unknown
//
//        if viewModel.avatarStatus == "active" {
//            status = .active
//        }
//        if viewModel.avatarStatus == "dead" {
//            status = .dead
//        }
//        if viewModel.avatarStatus == "unknown" {
//            status = .unknown
//        }
//        return status
//    }
}
