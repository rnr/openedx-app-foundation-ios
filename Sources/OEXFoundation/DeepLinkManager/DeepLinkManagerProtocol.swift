//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 26/11/2024.
//

import Foundation
import UIKit

@MainActor
public protocol DeepLinkManagerProtocol: Sendable {
    func processLinkFrom(userInfo: [AnyHashable: Any])
    func processDeepLink(with params: [AnyHashable: Any]?)
}
