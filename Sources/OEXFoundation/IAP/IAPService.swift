//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

public protocol IAPConfiguration {
    var productName: String { get }
    var sku: String { get }
    var courseID: String { get }
}

@MainActor
public protocol IAPServiceProtocol {
    associatedtype Configuration: IAPConfiguration
    func dashboardPrimaryCardButton(configuration: Configuration) -> AnyView
    func courseButton(configuration: Configuration) -> AnyView
}
