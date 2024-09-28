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
    
    func makeWindow(title: String, viewController controller: NSViewController, width: CGFloat? = nil, height: CGFloat? = nil) {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        if let width, let height {
            window.minSize = NSSize(width: width, height: height)
        }
        window.title = title
        window.contentViewController = controller
        window.layoutIfNeeded()
        window.center()
        window.makeKeyAndOrderFront(nil)
        Self.windows.append(window)
    }
    
}
