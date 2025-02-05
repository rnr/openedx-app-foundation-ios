//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

// ------- V1 ---------
public struct ViewRepresentable: UIViewRepresentable {
    var uiView: UIView
    
    public init(uiView: UIView) {
        self.uiView = uiView
    }
    
    public func makeUIView(context: Context) -> UIView {
        uiView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}

@MainActor
public protocol IAPServiceProtocol {
    func someTestView() -> UIView?
}

public struct IAPCommonService: IAPServiceProtocol {
    public init() {}
    public func someTestView() -> UIView? {
        nil
    }
}

// ------- V2 ---------
public protocol V2IAPServiceProtocol {
    func someTestView() -> AnyView
}
