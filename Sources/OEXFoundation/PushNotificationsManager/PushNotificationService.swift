//
//  PushNotificationService.swift
//  OpenEdX
//
//  Created by Anton Yarmolenka on 22/11/2024.
//

import Foundation

public protocol PushNotificationsProvider: Sendable {
    func didRegisterWithDeviceToken(deviceToken: Data)
    func didFailToRegisterForRemoteNotificationsWithError(error: Error)
    func synchronizeToken()
    func refreshToken()
}

@MainActor
public protocol PushNotificationsListener: Sendable {
    func shouldListenNotification(userinfo: [AnyHashable: Any]) -> Bool
    func didReceiveRemoteNotification(userInfo: [AnyHashable: Any])
}
