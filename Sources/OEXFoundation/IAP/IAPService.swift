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

@MainActor
public protocol AnyIAPServiceProtocol {
    init<Service: IAPServiceProtocol>(_ service: Service)
    
    func dashboardPrimaryCardButton(configuration: Any) -> AnyView?
    func courseButton(configuration: Any) -> AnyView?
}

@MainActor
public struct AnyIAPService: AnyIAPServiceProtocol {
    private let _dashboardPrimaryCardButton: (Any) -> AnyView?
    private let _courseButton: (Any) -> AnyView?

    public init<Service: IAPServiceProtocol>(_ service: Service) {
        _dashboardPrimaryCardButton = { config in
            guard let config = config as? Service.Configuration else {
                return nil
            }
            return service.dashboardPrimaryCardButton(configuration: config)
        }
        
        _courseButton = {@MainActor config in
            guard let config = config as? Service.Configuration else {
                return nil
            }
            return service.courseButton(configuration: config)
        }
    }
    
    public func dashboardPrimaryCardButton(configuration: Any) -> AnyView? {
        return _dashboardPrimaryCardButton(configuration)
    }
    
    public func courseButton(configuration: Any) -> AnyView? {
        return _courseButton(configuration)
    }
}
