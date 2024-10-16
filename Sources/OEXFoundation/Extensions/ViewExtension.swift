//
//  FirstAppear.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import Foundation
@_spi(Advanced) import SwiftUIIntrospect
import SwiftUI

public extension View {
    func frameLimit(width: CGFloat? = nil) -> some View {
        modifier(ReadabilityModifier(width: width))
    }
    
    @ViewBuilder
    func adaptiveHStack<Content: View>(
        spacing: CGFloat = 0,
        currentOrientation: UIInterfaceOrientation,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if currentOrientation.isLandscape && UIDevice.current.userInterfaceIdiom != .pad {
            VStack(alignment: .center, spacing: spacing, content: content)
        } else if currentOrientation.isPortrait && UIDevice.current.userInterfaceIdiom != .pad {
            HStack(spacing: spacing, content: content)
        } else if UIDevice.current.userInterfaceIdiom != .phone {
            HStack(spacing: spacing, content: content)
        }
    }
    
    @ViewBuilder
    func adaptiveStack<Content: View>(
        spacing: CGFloat = 0,
        isHorizontal: Bool,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if isHorizontal, UIDevice.current.userInterfaceIdiom != .pad {
            HStack(spacing: spacing, content: content)
        } else {
            VStack(alignment: .center, spacing: spacing, content: content)
        }
    }
    
    @ViewBuilder
    func adaptiveNavigationStack<Content: View>(
        spacing: CGFloat = 0,
        isHorizontal: Bool,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            HStack(spacing: spacing, content: content)
        } else {
            if isHorizontal {
                HStack(alignment: .top, spacing: spacing, content: content)
            } else {
                VStack(alignment: .center, spacing: spacing, content: content)
            }
        }
    }
    
    func onRightSwipeGesture(perform action: @escaping () -> Void) -> some View {
        self.gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width > 0 && abs(value.translation.height) < 50 {
                        action()
                    }
                }
        )
    }
    
    func onBackground(_ f: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
            perform: { _ in f() }
        )
    }
    
    func onForeground(_ f: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification),
            perform: { _ in f() }
        )
    }
    
    func onFirstAppear(_ action: @escaping () -> Void) -> some View {
        modifier(FirstAppear(action: action))
    }
    
    func backViewStyle(topPadding: CGFloat = -10) -> some View {
        return self
            .frame(height: 24)
            .padding(.horizontal, 8)
            .offset(y: topPadding)
    }
    
    @ViewBuilder
    private func onTapBackgroundContent(enabled: Bool, _ action: @escaping () -> Void) -> some View {
        if enabled {
            Color.clear
                .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)
                .contentShape(Rectangle())
                .onTapGesture(perform: action)
        }
    }

    func onTapBackground(enabled: Bool, _ action: @escaping () -> Void) -> some View {
        background(
            onTapBackgroundContent(enabled: enabled, action)
        )
    }
}

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

private struct FirstAppear: ViewModifier {
    let action: () -> Void
    
    // Use this to only fire your block one time
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        // And then, track it here
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}

public extension EnvironmentValues {
    @MainActor
    var isHorizontal: Bool {
        if UIDevice.current.userInterfaceIdiom != .pad {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                return windowScene.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? true
            }
        }
        return false
    }
}
