//
//  WindowControllerDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/18/24.
//

import AppKit

fileprivate var controllers = [NSWindowController]()

func showWindowControllerDemo() {
    let window = NSWindow(
        contentRect: .zero,
        styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
        backing: .buffered,
        defer: false
    )
    window.title = "Window Controller Demo"
    
    let windowController = CustomWindowController(window: window)
    windowController.contentViewController = NSViewController()
    windowController.window?.center()
    windowController.showWindow(nil)
    controllers.append(windowController)
}
