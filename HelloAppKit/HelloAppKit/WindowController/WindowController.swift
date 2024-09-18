//
//  WindowController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/28/24.
//

import Cocoa

func showWindowControllerDemo() {
    let window = NSWindow(
        contentRect: .zero,
        styleMask: [.titled, .closable, .resizable, /* .miniaturizable */],
        backing: .buffered,
        defer: false
    )
    window.title = "Window Controller Demo"
    let windowController = CustomWindowController(window: window)
    windowController.contentViewController = NSViewController()
    WindowLiner(window: window).moveToCenter()
    windowController.showWindow(nil)
}

class CustomWindowController: NSWindowController {

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
