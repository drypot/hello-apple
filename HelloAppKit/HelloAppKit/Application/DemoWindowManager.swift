//
//  DemoWindowManager.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

class DemoWindowManager {
    
    private static var windows: [NSWindow] = []
    
    static let shared = DemoWindowManager()
    
    func makeWindow(_ title: String, _ controller: NSViewController) {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = title
        window.contentViewController = controller
        window.layoutIfNeeded()
        window.center()
        window.makeKeyAndOrderFront(nil)
        Self.windows.append(window)
    }
    
}
