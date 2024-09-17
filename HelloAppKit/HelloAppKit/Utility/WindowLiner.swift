//
//  WindowLiner.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/15/24.
//

import AppKit

struct WindowLiner {

    let window: NSWindow
    
    func moveToCenter() {
        window.center()
        
//        guard let window = self.window else { return }
//        guard let screen = window.screen ?? NSScreen.main else { return }
//
//        let screenRect = screen.visibleFrame
//        let windowSize = window.frame.size
//
//        let newOriginX = (screenRect.width - windowSize.width) / 2 + screenRect.origin.x
//        let newOriginY = (screenRect.height - windowSize.height) / 2 + screenRect.origin.y
//
//        window.setFrameOrigin(NSPoint(x: newOriginX, y: newOriginY))
        
    }
    
}
