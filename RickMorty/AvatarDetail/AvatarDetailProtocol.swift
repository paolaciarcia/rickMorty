//
//  AvatarDetailProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 30/03/23.
//

import UIKit

protocol AvatarDetailViewType: UIView {
    func show(viewModel: AvatarInformationViewModel)
}

protocol AvatarInformationViewType {
    func show(viewModel: AvatarInformationViewModel)
}

protocol AvatarDetailPresenterType {
    func loadAvatarDetail()
}

protocol AvatarDetailViewControllerType: AnyObject {
    func showAvatarDetail(viewModel: AvatarInformationViewModel)
}
