//
//  SubRunner.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

class SubRunner: NSObject {

    static let moduleName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String

    override required init() {}
    
    func run() {
        openWindowWithDefaultViewController()
    }
    
    func openWindowWithDefaultViewController() {
        let className = String(describing: Self.self)

        let subject = String(className.dropSuffix("Runner"))
        let controllerPath = Self.moduleName + "." + subject + "Controller"
        guard let controllerType = NSClassFromString(controllerPath) as? NSViewController.Type else {
            print("View controller not found for \(controllerPath)")
            return
        }
        
        let title = subject

        openWindow(title: title, controller: controllerType.init())
    }

    func openWindow(title: String, controller: NSViewController) {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )

        let windowController = SelfRetainingWindowController(window: window)
        windowController.contentViewController = controller

        window.title = title
        window.layoutIfNeeded()
        window.center()
        
        windowController.showWindow(nil)
        //window.makeKeyAndOrderFront(nil)
    }
    
}
