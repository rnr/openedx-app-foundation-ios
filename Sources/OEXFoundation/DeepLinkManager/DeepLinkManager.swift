//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 26/11/2024.
//

import Foundation
import UIKit

public protocol DeepLinkManagerProtocol {
    func processLinkFrom(userInfo: [AnyHashable: Any])
}
