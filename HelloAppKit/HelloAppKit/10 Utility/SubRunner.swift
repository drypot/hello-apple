//
//  SubRunner.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

class SubRunner: NSObject {

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

        let subjectName = String(className.dropSuffix("Runner"))
        let controllerPath = Self.moduleName + "." + subjectName + "Controller"
        guard let controllerType = NSClassFromString(controllerPath) as? NSViewController.Type else {
            print("View controller not found for \(controllerPath)")
            return
        }
        
        let title = subjectName

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


