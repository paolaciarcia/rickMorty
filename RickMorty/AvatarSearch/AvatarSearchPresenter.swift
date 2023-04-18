//
//  AvatarSearchPresenter.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 12/04/23.
//

import Foundation

final class AvatarSearchPresenter: AvatarSearchPresenterType {
    weak var viewController: AvatarSearchViewControllerType?

    private var filterName: String?
    private var filterStatus: String?

    func filterAvatar(name: String?) {
        filterName = name
    }

    func filterAvatar(status: String?) {
        filterStatus = status
    }

    func filterAvatar() {
        viewController?.filterAvatar(name: filterName ?? "", status: filterStatus ?? "")
    }
}
