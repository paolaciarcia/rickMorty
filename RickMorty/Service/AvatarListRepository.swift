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
        service.requestAvatarList { [weak self] result in
            self?.decodeRequestResult(result: result,
                                      completion: completion)
        }
    }
}
    extension AvatarListRepository {
        private func decodeRequestResult<T: Decodable>(result: Result<Data, Error>,
                                                       completion: @escaping (Result<T, Error>) -> Void) {
            //mesma implementação do service
            switch result {
            case .success(let success):
                <#code#>
            case .failure(let failure):
                <#code#>
            }

            guard let url = URL(string: urlString) else {
                completion(.failure(APIServiceError.invalidURL))
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                guard error != nil else {
                    completion(.failure(APIServiceError.requestError))
                    return
                }

                guard let jsonData = data else {
                    completion(.failure(APIServiceError.jsonData))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(T.self, from: jsonData)
                    completion(.success(decoded))
                } catch let error {
                    completion(.failure(error))
                }
            }.resume()

        }
    }
