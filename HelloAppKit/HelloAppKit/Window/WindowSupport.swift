//
//  WindowSupport.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/28/24.
//

import AppKit

enum WindowSupport {
    
    static func openNewWindow(viewController: NSViewController, title: String? = nil, size: NSSize? = nil, center: Bool = true) {
        /*
         let screenSize = NSScreen.main?.frame.size ?? .zero
         let windowSize = NSSize(width: 800, height: 600)
         let windowRect = NSRect(
             x: screenSize.width/2 - windowSize.width/2,
             y: screenSize.height/2 - windowSize.height/2,
             width: windowSize.width,
             height: windowSize.height
         )
         */
        /*
        let windowRect: NSRect = .zero
        let window = NSWindow(
            contentRect: windowRect,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = title
         let windowController = NSWindowController(window: window)
         windowController.contentViewController = viewController
         WindowLiner(window: windowController.window!).moveToCenter()
         windowController.showWindow(nil)
        */

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
