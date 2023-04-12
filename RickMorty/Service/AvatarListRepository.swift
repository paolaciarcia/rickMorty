//
//  AvatarListRepository.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/03/23.
//

import Foundation

enum HTTPMethodRequest {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
}

enum URLRequest {
    case avatarList(page: Int)

    var method: String {
        switch self {
        case .avatarList:
            return HTTPMethodRequest.get
        }
    }

    var path: String {
        switch self {
        case .avatarList:
            return "https://rickandmortyapi.com/api/character"
        }
    }
}

final class AvatarListRepository: AvatarListRepositoryType {
    private let service: AvatarListService

    init(service: AvatarListService = AvatarListService()) {
        self.service = service
    }

    func fetchAvatar(pageIndex: Int,
                     name: String?,
                     status: String?,
                     completion: @escaping (Result<AvatarList, Error>) -> Void) {
//        guard let name = name,
//              let status = status else { return }
        service.requestAvatarList(method: HTTPMethodRequest.get,
                                  url: "https://rickandmortyapi.com/api/character/?page=\(pageIndex)&?name=\(name ?? "")&status=\(status ?? "")",
                                  parameters: [:],
                                  completion: completion)
    }

    func fetchFilteredAvatar(pageIndex: Int,
                             name: String,
                             status: String,
                             completion: @escaping (Result<AvatarList, Error>) -> Void) {

        service.requestAvatarList(method: HTTPMethodRequest.get,
                                  url: "https://rickandmortyapi.com/api/character/?page=\(pageIndex)&?name=\(name)&status=\(status)",
                                  parameters: [:],
                                  completion: completion)
    }
}
