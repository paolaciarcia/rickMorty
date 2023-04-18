//
//  AvatarDetailProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//
import Foundation

protocol AvatarListServiceProtocol {
    func requestAvatarList<T: Decodable>(method: String,
                                         url urlString: String,
                                         parameters: [String: Any],
                                         completion: @escaping (Result<T, Error>) -> Void)
}

protocol AvatarListRepositoryType {
    func fetchAvatar(pageIndex: Int,
                     name: String,
                     status: String,
                     completion: @escaping (Result<AvatarList, Error>) -> Void)
}

protocol AvatarListViewType {
    func show(state: AvatarListState)
}

protocol AvatarListViewControllerType: AnyObject {
    func show(state: AvatarListState)
    func redirectToAvatarDetail(with viewModel: AvatarCellViewModel)
}

protocol AvatarListPresenterType: AnyObject {
    var viewController: AvatarListViewControllerType? { get set }
    func loadAvatarList()
    func getAvatarDetail(index: Int)
    func updateFilterOptions(name: String, status: String)
    func fetchMoreItems()
    func reloadAvatarList()
}

protocol AvatarListViewControllerDelegate: AnyObject {
    func showAvatarDetail(with viewModel: AvatarCellViewModel)
    func openAvatarFilter(filterDelegate: AvatarSearchFilterDelegate)
}
