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
    private let filteredName: String = ""
    private let filteredStatus: String = ""

    private var viewModel: AvatarListViewModel

    init(repository: AvatarListRepositoryType = AvatarListRepository(),
         viewModel: AvatarListViewModel) {
        self.repository = repository
        self.viewModel = viewModel
    }

    func loadAvatarList() {
        viewController?.show(state: .loading)
        /*
         repository.fetchAvatar(filteredName: filteredName,
         filteredStatus: filteredStatus) { [weak self] result in
         */

        repository.fetchAvatar { [weak self] result in
            switch result {
            case .success(let avatarResult):
                self?.adaptAvatar(list: avatarResult.results)
                print("JSONDATA: \(result)")
//                self?.viewController?.show(state: .error)
//                self?.viewController?.show(state: .loading)
            case .failure:
                self?.viewController?.show(state: .error)
            }
        }
    }

    private func adaptAvatar(list: [Results]) {
        let cells = list.map { list in
            return AvatarCellViewModel(avatarImageURL: list.image,
                                       avatarName: list.name,
                                       avatarStatus: list.status,
                                       avatarSpecie: list.species,
                                       avatarType: list.type,
                                       avatarGender: list.gender)
        }

        viewModel = AvatarListViewModel(cells: cells)
        viewController?.show(state: .ready(viewModel: viewModel))
    }

    func showAvatarList(index: Int) {
        if let cellViewModel = viewModel.cells[safe: index] {
            viewController?.redirectToAvatarDetail(with: cellViewModel)
        }
    }
}
