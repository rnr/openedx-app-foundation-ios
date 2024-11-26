//
//  PushNotificationService.swift
//  OpenEdX
//
//  Created by Anton Yarmolenka on 22/11/2024.
//

import Foundation

public protocol PushNotificationsProvider {
    func didRegisterWithDeviceToken(deviceToken: Data)
    func didFailToRegisterForRemoteNotificationsWithError(error: Error)
    func synchronizeToken()
    func refreshToken()
}

public protocol PushNotificationsListener {
    func shouldListenNotification(userinfo: [AnyHashable: Any]) -> Bool
    func didReceiveRemoteNotification(userInfo: [AnyHashable: Any])
}
