//
//  AvatarDetailProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 24/02/23.
//
import Foundation

protocol AvatarInformationViewType {
    func show(viewModel: AvatarInformationViewModel)
}

protocol AvatarListServiceProtocol {
    func requestAvatarList<T: Decodable>(method: String,
                                         url urlString: String,
                                         parameters: [String: Any],
                                         completion: @escaping (Result<T, Error>) -> Void)
}

protocol AvatarListRepositoryType {
    func fetchAvatar(completion: @escaping (Result<AvatarList, Error>) -> Void)
}

protocol AvatarListViewType {
    func show(state: AvatarListState)
}

protocol AvatarListViewControllerType: AnyObject {
    func show(state: AvatarListState)
}

protocol AvatarListPresenterType: AnyObject {
    func loadAvatarList()
}
