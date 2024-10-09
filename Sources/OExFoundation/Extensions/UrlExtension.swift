//
//  File.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import Foundation
import SwiftUI

public extension URL {
    func isImage() -> Bool {
        if self.pathExtension == "jpg"
            || self.pathExtension == "png"
            || self.pathExtension == "PNG"
            || self.pathExtension == "gif"
            || self.pathExtension == "jpeg"
            || self.pathExtension == "JPEG"
            || self.pathExtension == "JPG"
            || self.pathExtension == "bmp" {
            return true
        } else {
           return false
        }
    }
}
