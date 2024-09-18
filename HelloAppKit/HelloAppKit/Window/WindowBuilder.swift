//
//  WindowBuilder.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/28/24.
//

import AppKit

struct WindowBuilder {
    
    private static var windows = [NSWindow]()
    
    let window: NSWindow

    init(title: String, window: NSWindow) {
        self.window = window
        self.window.title = title
    }
    
    init(title: String, viewController: NSViewController) {
        let window = NSWindow(contentViewController: viewController)
        self.init(title: title, window: window)
    }
    
    func setTitle(_ title: String) -> WindowBuilder{
        window.title = title
        return self
    }
    
    func setSize(_ size: NSSize) -> WindowBuilder {
        window.setContentSize(size)
        return self
    }
    
    func show() -> WindowBuilder {
        window.makeKeyAndOrderFront(nil)
        return self
    }

    func showAtCenter() -> WindowBuilder {
        window.center()
        return show()

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
    
    func showAtAbsoluteCenter() -> WindowBuilder {
        let screenSize = NSScreen.main?.frame.size ?? .zero
        let windowSize = window.frame.size
        let windowRect = NSRect(
            x: screenSize.width/2 - windowSize.width/2,
            y: screenSize.height/2 - windowSize.height/2,
            width: windowSize.width,
            height: windowSize.height
        )
        window.setFrame(windowRect, display: true)
        return show()
    }
    
    func retainWindow() {
        Self.windows.append(window)
    }

    /*
    static func openStyledWindow(viewController: NSViewController, title: String? = nil, size: NSSize? = nil, center: Bool = true) -> NSWindow {
        let window = NSWindow(contentViewController: viewController)
        if let title {
            window.title = title
        }
        if let size {
            window.setContentSize(size)
        }
        if center {
            WindowLiner(window: window).moveToCenter()
        }
        window.makeKeyAndOrderFront(nil)
        
        /*
             let windowStyle: NSWindow.StyleMask = [.titled, .closable, .resizable, .miniaturizable]
             
             print("\(windowRect)")
             window = NSWindow(
                 contentRect: windowRect,
                 styleMask: windowStyle,
                 backing: .buffered,
                 defer: false
             )
             window.title = "Hello AppKit"
             window.contentViewController = NSViewController()
             window.makeKeyAndOrderFront(nil)
         }
         
         */

        return window
    }
     */
}

