//
//  UIBarButtonItem+Ext.swift
//  RickMorty
//
//  Created by Paola Golombieski Ciarcia on 01/05/23.
//

import UIKit

extension UIBarButtonItem {
    func simulateTap() {
        guard let target = target,
              let action = action else { return }

        let controlEvent = UIControl.Event(rawValue: UInt(Int.bitWidth))

        target.performSelector(onMainThread: action, with: self, waitUntilDone: true, modes: [RunLoop.Mode.common.rawValue])

//        target.performSelector(onMainThread: action, with: self, waitUntilDone: true, modes: [RunLoop.Mode.commonModes.rawValue])

        target.sendActions(for: controlEvent)
    }
}
