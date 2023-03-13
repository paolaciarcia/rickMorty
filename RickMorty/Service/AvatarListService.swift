//
//  AvatarListService.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 10/03/23.
//

import UIKit
import Network

enum APIServiceError: Error {
    case invalidURL
    case requestError
    case jsonData
}

final class AvatarListService: AvatarListServiceProtocol {
    private var task: URLSessionDataTask?

    func requestAvatarList<T: Decodable>(method: String,
                                         url urlString: String,
                                         parameters: [String: Any],
                                         completion: @escaping (Result<T, Error>) -> Void) {
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
