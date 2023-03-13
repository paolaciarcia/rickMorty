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
    case avatarList

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

    init(service: AvatarListService) {
        self.service = service
    }

    func fetchAvatar(completion: @escaping (Result<AvatarList, Error>) -> Void) {
        service.requestAvatarList(method: HTTPMethodRequest.get,
                                  url: "https://rickandmortyapi.com/api/character",
                                  parameters: [:],
                                  completion: completion)
    }
}
