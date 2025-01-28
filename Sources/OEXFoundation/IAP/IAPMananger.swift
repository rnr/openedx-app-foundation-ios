//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

public protocol IAPServiceProtocol {
//    func someTestView() -> any View
    @ViewBuilder var someTestView: any View { get }
}

public protocol IAPManagerProtocol {
//    func testView() -> any View
}
