//
//  AvatarListServiceTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

import Quick
import Nimble
import Foundation
import Network

@testable import RickMorty

extension URL {
    static func stub() -> URL {
        return URL(string: "https://stub.url.com")!
    }
}

extension HTTPURLResponse {
    static func stub(url: URL = .stub(), statusCode: Int = 200) -> HTTPURLResponse? {
        return HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    }
}

final class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}

final class MockURLSession: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    var data: Data?
    var error: Error?
    var statusCode: Int = 200
    var passedRequest: URLRequest?
    var response: HTTPURLResponse? = .stub()

    override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        passedRequest = request
        return URLSessionDataTaskMock { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
    }
}

final class AvatarListServiceTests: QuickSpec {
    override func spec() {
//        var result: Result<AvatarList, APIServiceError>?
        var mockSession: MockURLSession!
        var sut: AvatarListService!

        beforeEach {
            mockSession = MockURLSession()
            sut = AvatarListService(session: mockSession)
        }

        describe("#requestAvatarList") {
            xcontext("when given a valid URL") {
                beforeEach {
                    mockSession.data = """
                    {"name": "Avatar 1", "status": "Active"}
                    """.data(using: .utf8)!
                }

                it("returns the expected result") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success(let result):
                            expect(result) == .stub()
                        case .failure:
                            fail("The request did fail because the Object couldn't be parsed")
                        }
                    }
                }
            }

            xcontext("and the request fails with requestError") {
                beforeEach {
                    mockSession.response = nil
                }

                it("should return a decoding error") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success:
                            fail("The request should not be successfull")
                        case let .failure(error):
                            expect(error) == .requestError
                        }
                    }
                }
            }

            context("and the request fails with notFound") {
                beforeEach {
                    mockSession.error = NSError(domain: "AvatarListServiceTests", code: 404, userInfo: [:])
                }

                it("should return a decoding error") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success:
                            fail("The request should not be successfull")
                        case let .failure(error):
                            expect(error) == .notFound
                        }
                    }
                }
            }

            context("and the request returns an invalid data") {
                beforeEach {
                    mockSession.data = nil
                }

                it("should return an api error") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success:
                            fail("The request should not be successfull")
                        case let .failure(error):
                            expect(error) == .jsonData
                        }
                    }
                }
            }
        }
    }
}
            /*
                    {
                    "info": {
                    "pages": 4
                    },
                    "results": [
                    {
                    "name": "Rick Sanchez",
                    "status": "Alive",
                    "species": "Human",
                    "type": "",
                    "gender": "Male",
                    "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
                    }]
                    }
*/
