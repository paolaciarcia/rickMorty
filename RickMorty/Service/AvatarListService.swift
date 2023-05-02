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
    case requestError//ok
    case jsonData//ok
    case notFound//ok
    case decodeFailure//ok
}

final class AvatarListService: AvatarListServiceProtocol {
    private var session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func requestAvatarList<T: Decodable>(urlEndpoints: URLEndpoints,
                                         completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard let url = URL(string: urlEndpoints.path) else {
            completion(.failure(APIServiceError.invalidURL))
            return
        }

        session.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(APIServiceError.requestError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            guard httpResponse.statusCode != 404 else {
                completion(.failure(APIServiceError.notFound))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
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
            } catch {
                completion(.failure(APIServiceError.decodeFailure))
            }
        }.resume()
    }
}
