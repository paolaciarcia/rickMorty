//
//  AvatarListPresenter.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 13/03/23.
//

import Foundation

final class AvatarListPresenter: AvatarListPresenterType {
    weak var viewController: AvatarListViewControllerType?
    private let repository: AvatarListRepositoryType
    private var viewModel: AvatarListViewModel

    init(viewController: AvatarListViewControllerType,
         repository: AvatarListRepositoryType,
         viewModel: AvatarListViewModel) {
        self.viewController = viewController
        self.repository = repository
        self.viewModel = viewModel
    }

    func loadAvatarList() {
        viewController?.show(state: .loading)

        repository.fetchAvatar { [weak self] result in
            switch result {
            case .success(let avatarResult):
                self?.adaptAvatar(list: avatarResult.results)
            case .failure:
                self?.viewController?.show(state: .error)
            }
        }
    }

    private func adaptAvatar(list: [Results]) {
        let cells = list.map { list in
            return AvatarCellViewModel(avatarImageURL: "https://rickandmortyapi.com/api/character/avatar/\(list.id).jpeg",
                                       avatarName: list.name,
                                       avatarStatus: list.status,
                                       avatarSpecie: list.species,
                                       avatarType: list.species,
                                       avatarGender: list.gender)
        }

        viewModel = AvatarListViewModel(cells: cells)
        viewController?.show(state: .ready(viewModel: viewModel))
    }
}
