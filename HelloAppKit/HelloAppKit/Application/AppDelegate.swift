//
//  AppDelegate.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/27/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        print("AppDelegate applicationWillFinishLaunching")
#if DEV
        print("Compiler flag DEV defined")
#else
        print("Compiler flag DEV not defined")
#endif
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("AppDelegate applicationDidFinishLaunching")
        let viewController = CodeListController()
        WindowSupport.openNewWindow(viewController: viewController, title: "Hello AppKit")
   }

    func applicationWillTerminate(_ aNotification: Notification) {
        print("AppDelegate applicationWillTerminate")
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}
