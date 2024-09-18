//
//  WindowBuilderDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/18/24.
//

import AppKit

func showWindowBuilderDemo() {
    
    {
        // show
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        WindowBuilder(title: "Window Liner / Normal", window: window)
            .setSize(NSSize(width: 700, height: 500))
            .show()
            .retainWindow()
    }();
    
    {
        // show center
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        WindowBuilder(title: "Window Liner / Center", window: window)
            .setSize(NSSize(width: 600, height: 400))
            .showAtCenter()
            .retainWindow()
    }();
    
    {
        // show absolute center
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        WindowBuilder(title: "Window Liner / Absolute Center", window: window)
            .setSize(NSSize(width: 500, height: 300))
            .showAtAbsoluteCenter()
            .retainWindow()
    }();
    
}
