//
//  AvatarSearchProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 11/04/23.
//

import Foundation

protocol AvatarSearchViewControllerType: AnyObject {
    func show(viewModel: [StatusCellViewModel])
}

protocol AvatarSearchPresenterType {}

protocol AvatarSearchViewControllerDelegate: AnyObject {}
