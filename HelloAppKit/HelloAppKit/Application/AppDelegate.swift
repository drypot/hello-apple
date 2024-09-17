//
//  AppDelegate.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/27/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var windowController: NSWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("AppDelegate applicationDidFinishLaunching")

        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Hello AppKit"

        windowController = NSWindowController(window: window)
        windowController.contentViewController = CodeListController()
        WindowLiner(window: windowController.window!).moveToCenter()
        windowController.showWindow(nil)
        
#if DEV
        print("Compiler flag DEV defined")
#else
        print("Compiler flag DEV not defined")
#endif

   }

    func applicationWillTerminate(_ aNotification: Notification) {
        print("AppDelegate applicationWillTerminate")
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}
