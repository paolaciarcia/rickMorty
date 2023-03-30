//
//  AvatarDetailProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 30/03/23.
//

import Foundation

protocol AvatarDetailPresenterType {
    func loadAvatarDetail()
}

protocol AvatarDetailViewControllerType: AnyObject {
    func showAvatarDetail(viewModel: AvatarInformationViewModel)
}
