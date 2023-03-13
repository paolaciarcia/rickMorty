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
    func requestAvatarList<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}

protocol AvatarListRepositoryType {
    func fetchAvatar(completion: @escaping (Result<AvatarList, Error>) -> Void)
}
