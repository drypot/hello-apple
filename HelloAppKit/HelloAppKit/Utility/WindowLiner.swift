//
//  WindowLiner.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/15/24.
//

import AppKit

func showWindowLinerDemo() {
    
    {
        // show center
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = "Window Liner / Center"
        window.setContentSize(NSSize(width: 700, height: 500))
        WindowLiner(window: window).moveToCenter()
        window.makeKeyAndOrderFront(nil)
        WindowKeeper.shared.add(window)
    }();
    
    {
        // show absolute center
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = "Window Liner / Absolute Center"
        window.setContentSize(NSSize(width: 600, height: 400))
        WindowLiner(window: window).moveToAbsoluteCenter()
        window.makeKeyAndOrderFront(nil)
        WindowKeeper.shared.add(window)
    }();
    
}

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
    
    func moveToAbsoluteCenter() {
        let screenSize = NSScreen.main?.frame.size ?? .zero
        let windowSize = window.frame.size
        let windowRect = NSRect(
            x: screenSize.width/2 - windowSize.width/2,
            y: screenSize.height/2 - windowSize.height/2,
            width: windowSize.width,
            height: windowSize.height
        )
        window.setFrame(windowRect, display: true)
    }
}
