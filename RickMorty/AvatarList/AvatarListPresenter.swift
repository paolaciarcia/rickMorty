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
    private var currentPage: Int = 0
    private var totalPages = 1
    private var shouldRefresh: Bool = false

    private var avatarList: [Results] = []

    init(repository: AvatarListRepositoryType = AvatarListRepository(),
         viewModel: AvatarListViewModel) {
        self.repository = repository
        self.viewModel = viewModel
    }

    func showAvatarList(index: Int) {
        if let cellViewModel = viewModel.cells[safe: index] {
            viewController?.redirectToAvatarDetail(with: cellViewModel)
        }
    }

    func loadAvatarList() {
        if currentPage < totalPages {
            currentPage += 1
        }
        
        viewController?.show(state: .loading)

        repository.fetchAvatar(pageIndex: currentPage) { [weak self] result in
            switch result {
            case .success(let avatarResult):
                self?.totalPages = avatarResult.info.pages
                self?.appendItems(from: avatarResult.results)

//                self?.adaptAvatar(list: self?.avatarList)
                print("PAGE: \(self?.currentPage)")
//                self?.viewController?.show(state: .error)
//                self?.viewController?.show(state: .loading)
            case .failure:
                self?.viewController?.show(state: .error)
            }
        }
    }

    private func appendItems(from list: [Results]) {
        avatarList.append(contentsOf: list)
        adaptAvatar()
    }

    private func adaptAvatar() {
        let cells = avatarList.map { list in
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
}
