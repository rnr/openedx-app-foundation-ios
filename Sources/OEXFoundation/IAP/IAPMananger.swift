//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

public protocol IAPServiceProtocol {
    associatedtype GeneratedView: View
    func someTestView() -> GeneratedView
}

public protocol IAPManagerProtocol {
    associatedtype GeneratedView: View
    func testView() -> GeneratedView
}
