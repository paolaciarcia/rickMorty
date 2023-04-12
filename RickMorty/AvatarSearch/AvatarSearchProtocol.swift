//
//  AvatarSearchProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 11/04/23.
//

import Foundation

protocol AvatarSearchViewControllerType: AnyObject {
    func filterAvatar(avatarName: String?,
                      avatarStatus: String?)
}

protocol AvatarSearchPresenterType: AnyObject {
    func filterAvatar(name: String?)
    func filterAvatar(status: String?)
    func filterAvatar()
}

protocol AvatarSearchViewControllerDelegate: AnyObject {
    func showFilteredAvatar(avatarName: String?,
                            avatarStatus: String?)
}
