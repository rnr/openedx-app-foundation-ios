//
//  Notification.swift
//  Core
//
//  Created by Vladimir Chekyrta on 15.12.2022.
//

import Foundation

public extension Notification.Name {
    static let onActualVersionReceived = Notification.Name("onActualVersionReceived")
}

public extension Notification {
    enum UserInfoKey: String {
        case isForced
    }
}

