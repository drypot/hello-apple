//
//  SubRunner.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

class SubRunner: NSObject {

    static let runnerSuffix = "Runner"
    static let moduleName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String

    private static var windows: [NSWindow] = []
    
    override required init() {}

    static func runSubRunner(by name: String) {
        guard let runnerType = SubRunner.findClass(by: name) else {
            print("SubRunner type not found for \(name)")
            return
        }
        runnerType.init().run()
    }
    
    static func findClass(by name: String) -> SubRunner.Type? {
        let typeName = moduleName + "." + name
        return NSClassFromString(typeName) as? SubRunner.Type
    }
    
    func run() {
        openWindowWithDefaultViewController()
    }
    
    func openWindowWithDefaultViewController() {
        let className = String(describing: Self.self)
        assert(className.hasSuffix(Self.runnerSuffix))
        
        let controllerSuffix = "Controller"
        let controllerName = String(className.dropLast(Self.runnerSuffix.count))
        let controllerPath = Self.moduleName + "." + controllerName
        guard let controllerType = NSClassFromString(controllerPath) as? NSViewController.Type else {
            print("View controller not found for \(controllerPath)")
            return
        }
        
        let title = if controllerName.hasSuffix(controllerSuffix) {
            String(controllerName.dropLast(controllerSuffix.count))
        } else {
            controllerName
        }

        openWindow(title: title, controller: controllerType.init())
    }

    func openWindow(title: String, controller: NSViewController, width: CGFloat? = nil, height: CGFloat? = nil) {
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


