//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

public protocol IAPServiceProtocol {
    associatedtype V: View
    func someTestView() -> V
}

public protocol IAPManagerProtocol {
    var iapService: (any IAPServiceProtocol)? { get }
}
