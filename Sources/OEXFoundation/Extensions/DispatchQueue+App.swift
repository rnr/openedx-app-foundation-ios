//
//  DispatchQueue+App.swift
//  Core
//
//  Created by Vladimir Chekyrta on 15.09.2022.
//

import Foundation

@MainActor
public func doAfter(_ delay: TimeInterval? = nil, _ closure: @escaping () -> Void) {
    Task {
        try? await Task.sleep(for: .milliseconds((delay ?? 0) * 1000))
        closure()
    }
}

public func dispatchQueueMain(_ closure: @Sendable @escaping () -> Void) {
    DispatchQueue.main.async(execute: closure)
}
