//
//  AvatarListRepositoryTests.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

import Quick
import Nimble

@testable import RickMorty

final class AvatarListServiceMock: AvatarListServiceProtocol {

    private(set) var callRequestAvatarListCount = 0
    var expectedCompletion: Result<AvatarList, APIServiceError>?
    private(set) var expectedParameters: URLEndpoints?

    func requestAvatarList<T>(urlEndpoints: URLEndpoints, completion: @escaping (Result<T, APIServiceError>) -> Void) where T: Decodable {
        callRequestAvatarListCount += 1
        expectedParameters = urlEndpoints

        guard let result = expectedCompletion else { return }
        completion(result as! Result<T, APIServiceError>)
    }
}

final class AvatarListRepositoryTests: QuickSpec {
    override func spec() {
        var result: Result<AvatarList, APIServiceError>?
        var serviceMock: AvatarListServiceMock!
        var sut: AvatarListRepository!

        beforeEach {
            serviceMock = AvatarListServiceMock()
            sut = AvatarListRepository(service: serviceMock)
        }

        describe("#fetchAvatar") {
            context("when the service returns success") {
                beforeEach {
                    serviceMock.expectedCompletion = .success(.stub())
                    sut.fetchAvatar(pageIndex: 1, name: "Rick", status: "Dead") { result = $0 }
                }

                it("should call the service with the correct parameters") {
                    expect(serviceMock.callRequestAvatarListCount) == 1
                    expect(serviceMock.expectedParameters) == URLEndpoints.avatarList(pageIndex: 1, name: "Rick", status: "Dead")
                }

                it("should return the correct avatar list") {
                    expect(result).toEventually(equal(.success(.stub())))
                }
            }

            context("when the service returns failure") {
                let error = APIServiceError.notFound

                beforeEach {
                    serviceMock.expectedCompletion = .failure(.notFound)

                    sut.fetchAvatar(pageIndex: 2, name: "Morty", status: "Alive") { result = $0 }
                }

                it("should call the service with the correct parameters") {
                    expect(serviceMock.callRequestAvatarListCount) == 1
                    expect(serviceMock.expectedParameters) == URLEndpoints.avatarList(pageIndex: 2, name: "Morty", status: "Alive")
                }

                it("should return the correct error") {
                    expect(result).toEventually(equal(.failure(error)))
                }
            }
        }
    }
}
