//
//  URLSessionMock.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

import Foundation

final class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    var data: Data?
    var error: Error?
    var statusCode: Int = 200
    var passedUrl: URL?
    var response: HTTPURLResponse? = .stub()

    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
            passedUrl = url
            return URLSessionDataTaskMock { [weak self] in
                completionHandler(self?.data, self?.response, self?.error)
            }
        }
}
