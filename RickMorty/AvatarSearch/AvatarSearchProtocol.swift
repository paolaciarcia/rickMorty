//
//  AvatarSearchProtocol.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 11/04/23.
//

import Foundation

protocol AvatarSearchViewControllerType: AnyObject {
    func filterAvatar(name: String?, status: String?)
}

protocol AvatarSearchPresenterType: AnyObject {
    func filterAvatar(name: String?)
    func filterAvatar(status: String?)
    func filterAvatar()
}

protocol AvatarSearchFilterDelegate: AnyObject {
    func didUpdateFilterOptions(name: String?, status: String?)
}

protocol AvatarSearchViewControllerDelegate: AnyObject {
    func showFilteredAvatar()
}
