//
//  WindowKeeper.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/18/24.
//

import AppKit

class WindowKeeper {

    static let shared = WindowKeeper()
    
    private var windows = [NSWindow]()
    private var windowControllers = [NSWindowController]()

    private init() { }
    
    func add(_ window: NSWindow) {
        windows.append(window)
    }
    
    func add(_ windowController: NSWindowController) {
        windowControllers.append(windowController)
    }
    
}
