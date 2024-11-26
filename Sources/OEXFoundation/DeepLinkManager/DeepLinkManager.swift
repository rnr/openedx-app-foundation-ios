//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 26/11/2024.
//

import Foundation
import UIKit

public protocol DeepLinkService {
    func configureWith(
        manager: DeepLinkManagerProtocol,
        config: ConfigProtocol, // ToDo: move ConfigProtocol to OEXFoundation
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
    
    func handledURLWith(
        app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool
}

public protocol DeepLinkManagerProtocol {
    func processLinkFrom(userInfo: [AnyHashable: Any])
}
