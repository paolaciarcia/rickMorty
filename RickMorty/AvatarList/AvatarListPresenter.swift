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
    private var currentPage: Int = 0
    private var totalPages = 1
    private var avatarList: [Results] = []

    init(repository: AvatarListRepositoryType = AvatarListRepository(),
         viewModel: AvatarListViewModel) {
        self.repository = repository
        self.viewModel = viewModel
    }

    func fetchMoreItems() {
        viewModel.hasMorePages = currentPage < totalPages

        guard viewModel.hasMorePages else {
            viewModel.isFetching = false
            viewController?.show(state: .ready(viewModel: viewModel))
            return
        }
        viewModel.isFetching = true
        loadAvatarList()
    }

    func loadAvatarList() {
        viewController?.show(state: .loading)
        currentPage += 1

        repository.fetchAvatar(pageIndex: currentPage,
                               name: viewModel.filteredName,
                               status: viewModel.filteredStatus) { [weak self] result in
            switch result {
            case .success(let avatarResult):
                self?.totalPages = avatarResult.info.pages
                self?.avatarList.append(contentsOf: avatarResult.results)
                self?.adaptAvatar()
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }

    func newSearchFromAvatarList() {
        viewModel.filteredName = ""
        viewModel.filteredStatus = ""
        cleanAvatarList()
        loadAvatarList()
    }

    func getAvatarDetail(index: Int) {
        if let cellViewModel = viewModel.cells[safe: index] {
            viewController?.redirectToAvatarDetail(with: cellViewModel)
        }
    }

    func updateFilterOptions(name: String, status: String) {
        viewModel.filteredName = name
        viewModel.filteredStatus = status
        cleanAvatarList()
        loadAvatarList()
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

        viewModel.cells = cells
        viewController?.show(state: .ready(viewModel: viewModel))
    }

    private func cleanAvatarList() {
        currentPage = 0
        totalPages = 1
        avatarList.removeAll()
    }

    private func handleError(error: APIServiceError) {
        if error == .notFound {
            viewController?.show(state: .emptyState)
        } else {
            viewController?.show(state: .error)
        }
    }
}
