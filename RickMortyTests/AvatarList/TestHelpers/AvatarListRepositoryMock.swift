//
//  AvatarListRepositoryMock.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

@testable import RickMorty

final class AvatarListRepositoryMock: AvatarListRepositoryType {

    var expectedResult: Result<AvatarList, APIServiceError>?
    private(set) var expectedName: String?
    private(set) var expectedStatus: String?

    func fetchAvatar(pageIndex: Int,
                     name: String,
                     status: String,
                     completion: @escaping (Result<AvatarList, APIServiceError>) -> Void) {
        expectedName = name
        expectedStatus = status

        guard let result = expectedResult else { return }
        completion(result)
    }
}
