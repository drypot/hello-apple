//
//  WindowDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/18/24.
//

import AppKit

class WindowDemoController: NSWindowController, DemoViewController {

    private static var controllers = [NSWindowController]()

    static func showDemo() {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = "Window Demo"
        
        let windowController = WindowDemoController(window: window)
        windowController.contentViewController = NSViewController()
        windowController.window?.center()
        windowController.showWindow(nil)
        controllers.append(windowController)
    }
    
    /*
     아래 3 메서드는 window 가 nib 이나 storyboard 파일을 통해 생성될 때만 실행되는 것 같다.
     WindowController 생성시 window 를 넘겨준 경우엔 실행될 타이밍이 오지 않는다.
     */
    
    override func loadWindow() {
        print("CodeListWindowController loadWindow")
    }
    
    override func windowWillLoad() {
        super.windowWillLoad()
        print("CodeListWindowController windowWillLoad")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        print("CodeListWindowController windowDidLoad")
    }
    
}
