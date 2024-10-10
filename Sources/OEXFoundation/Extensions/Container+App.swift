//
//  File.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import Foundation
import Swinject
import UIKit

public extension Container {
    static nonisolated(unsafe) let shared: Container = {
        let container = Container()
        return container
    }()
}

public extension UIViewController {
    var diContainer: Container {
        return Container.shared
    }
}
