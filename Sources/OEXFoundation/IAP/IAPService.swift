//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

public protocol IAPServiceProtocol: View {
    associatedtype ContentView: View
    func someTestView() -> ContentView
}
