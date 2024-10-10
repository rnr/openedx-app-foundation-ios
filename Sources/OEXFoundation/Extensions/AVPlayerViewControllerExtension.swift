//
//  AVPlayerViewControllerExtension.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//

import AVKit

public extension AVPlayerViewController {
    func enterFullScreen(animated: Bool) {
        perform(NSSelectorFromString("enterFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
    func exitFullScreen(animated: Bool) {
        perform(NSSelectorFromString("exitFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
}
