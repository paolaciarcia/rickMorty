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

final class AvatarListServiceTests: QuickSpec {
    override func spec() {
        var mockSession: URLSessionMock!
        var sut: AvatarListService!

        beforeEach {
            mockSession = URLSessionMock()
            sut = AvatarListService(session: mockSession)
        }

        describe("#requestAvatarList") {
            context("when request succeeds") {
                beforeEach {
                    mockSession.data = avatarListStub.data(using: .utf8)!
                }

                it("returns the expected result") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success(let result):
                            expect(result) == .stub()
                        case let .failure(error):
                            fail("The request should not fail: \(error)")
                        }
                    }
                }
            }

            context("when request fails with requestError") {
                beforeEach {
                    mockSession.response = nil
                }

                it("should return a request error") {
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

            context("when request fails with notFound") {
                beforeEach {
                    mockSession.response = .stub(statusCode: 404)
                }

                it("should return an error") {
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

            context("when request fails with invalid data") {
                beforeEach {
                    mockSession.data = nil
                }

                it("should return an error") {
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

            context("when request fails with invalidURL") {
                let expectedURL = "https://rickandmortyapi.com/api/character/?page=1&name=Rick&status=Dead"

                beforeEach {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (_: Result<AvatarList, APIServiceError>) in }
                }

                it("should return an error") {
                    expect(mockSession.passedUrl) == URL(string: expectedURL)
                }
            }

            context("when request fails with decodeFailure") {
                beforeEach {
                    mockSession.data = """
                    {"name": "Avatar 1", "status": "Active"}
                    """.data(using: .utf8)!
                }

                it("should return an error") {
                    sut.requestAvatarList(urlEndpoints: URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")) { (result: Result<AvatarList, APIServiceError>) in
                        switch result {
                        case .success:
                            fail("The request should not be successfull")
                        case let .failure(error):
                            expect(error) == .decodeFailure
                        }
                    }
                }
            }
        }
    }
}

private let avatarListStub = """
{
    "info": {
        "pages": 4
    },
    "results": [
        {
            "name": "Rich",
            "status": "Dead",
            "species": "Specie",
            "type": "Type",
            "gender": "Gender",
            "image": ""
        },
        {
            "name": "Rich",
            "status": "Dead",
            "species": "Specie",
            "type": "Type",
            "gender": "Gender",
            "image": ""
        },
        {
            "name": "Rich",
            "status": "Dead",
            "species": "Specie",
            "type": "Type",
            "gender": "Gender",
            "image": ""
        },
        {
            "name": "Rich",
            "status": "Dead",
            "species": "Specie",
            "type": "Type",
            "gender": "Gender",
            "image": ""
        }
     ]
}
"""
