//
//  WindowDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/18/24.
//

import AppKit

class WindowDemoControllerRunner: SubRunner {

    private var windowControllers = [NSWindowController]()

    override func run() {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
            backing: .buffered,
            defer: false
        )
        window.title = "Window 1"
        
        let windowController = WindowDemoWindowController(window: window)
        windowController.contentViewController = NSViewController()
        windowController.window?.center()
        windowController.showWindow(nil)
        windowControllers.append(windowController)
    }
}

class WindowDemoWindowController: NSWindowController {
    
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
