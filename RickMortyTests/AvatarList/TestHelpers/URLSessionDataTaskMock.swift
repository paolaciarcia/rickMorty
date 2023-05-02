//
//  URLSessionDataTaskMock.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

import Foundation

final class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
