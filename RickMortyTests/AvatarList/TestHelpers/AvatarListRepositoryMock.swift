//
//  AvatarListRepositoryMock.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

@testable import RickMorty

final class AvatarListRepositoryMock: AvatarListRepositoryType {

    var expectedResult: Result<AvatarList, APIServiceError>?

    func fetchAvatar(pageIndex: Int,
                     name: String,
                     status: String,
                     completion: @escaping (Result<AvatarList, APIServiceError>) -> Void) {
        guard let result = expectedResult else { return }
        completion(result)
    }
}
