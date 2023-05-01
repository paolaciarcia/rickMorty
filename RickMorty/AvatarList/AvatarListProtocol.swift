//
//  AvatarDetailProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//
import UIKit

protocol AvatarListServiceProtocol {
    func requestAvatarList<T: Decodable>(urlEndpoints: URLEndpoints,
                                         completion: @escaping (Result<T, APIServiceError>) -> Void)
}

protocol AvatarListRepositoryType {
    func fetchAvatar(pageIndex: Int,
                     name: String,
                     status: String,
                     completion: @escaping (Result<AvatarList, APIServiceError>) -> Void)
}

protocol AvatarListViewType: UIView {
    var didSelectItem: ((Int) -> Void)? { get set }
    var didSelectReloadList: (() -> Void)? { get set }
    var didSelectNewSearch: (() -> Void)? { get set }
    var fetchNewItems: (() -> Void)? { get set }

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
    func newSearchFromAvatarList()
}

protocol AvatarListViewControllerDelegate: AnyObject {
    func showAvatarDetail(with viewModel: AvatarCellViewModel)
    func openAvatarFilter(filterDelegate: AvatarSearchFilterDelegate)
}
