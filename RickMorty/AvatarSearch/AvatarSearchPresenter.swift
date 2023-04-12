//
//  AvatarSearchPresenter.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 12/04/23.
//

import Foundation

final class AvatarSearchPresenter: AvatarSearchPresenterType {
    weak var viewController: AvatarSearchViewControllerType?

    var avatarName: String?
    var avatarStatus: String?

    func filterAvatar(name: String?) {
        avatarName = name
    }

    func filterAvatar(status: String?) {
        avatarStatus = status
    }

    func filterAvatar() {
        viewController?.filterAvatar(avatarName: avatarName,
                                     avatarStatus: avatarStatus)
    }
}
