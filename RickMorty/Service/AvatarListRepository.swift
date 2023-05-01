//
//  AvatarListRepository.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/03/23.
//

import Foundation

enum HTTPRequestMethod {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
}

enum URLEndpoints {
    case avatarList(pageIndex: Int, name: String, status: String)

    var method: String {
        switch self {
        case .avatarList:
            return HTTPRequestMethod.get
        }
    }

    var path: String {
        switch self {
        case let .avatarList(pageIndex, name, status):
            return "https://rickandmortyapi.com/api/character/?page=\(pageIndex)&name=\(name)&status=\(status)"
        }
    }
}

final class AvatarListRepository: AvatarListRepositoryType {
    private let service: AvatarListService

    init(service: AvatarListService = AvatarListService()) {
        self.service = service
    }

    func fetchAvatar(pageIndex: Int,
                     name: String,
                     status: String,
                     completion: @escaping (Result<AvatarList, APIServiceError>) -> Void) {
        service.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: pageIndex,
                                                                        name: name,
                                                                        status: status),
                                  completion: completion)
    }
}
