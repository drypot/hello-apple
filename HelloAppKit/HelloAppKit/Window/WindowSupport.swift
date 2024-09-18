//
//  WindowSupport.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/28/24.
//

import AppKit

enum WindowSupport {
    
    static func openNewWindow(viewController: NSViewController, title: String? = nil, size: NSSize? = nil, center: Bool = true) -> NSWindow {
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
        return window
    }
    
}

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
