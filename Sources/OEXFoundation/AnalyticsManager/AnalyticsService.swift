//
//  AnalyticsManager.swift
//  OpenEdX
//
//  Created by  Stepanok Ivan on 27.06.2023.
//

import Foundation
import Swinject

public protocol AnalyticsService: Sendable {
    func identify(id: String, username: String?, email: String?)
    func logEvent(_ event: String, parameters: [String: Any]?)
    func logScreenEvent(_ event: String, parameters: [String: Any]?)
}
