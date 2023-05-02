//
//  HTTPURLResponse+Ext.swift
//  RickMortyTests
//
//  Created by Paola Golombieski Ciarcia on 02/05/23.
//

import Foundation

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
