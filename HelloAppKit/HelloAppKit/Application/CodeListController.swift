//
//  CodeListController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/27/24.
//

import Cocoa

class CodeListController: NSViewController {
    
    override func loadView() {
        print("CodeListController loadView")

        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 600))
//        self.view.wantsLayer = true
//        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        let buttonWidth = 200
        let buttonHeight = 32
        let padding = 16
        var nextY = Int(self.view.frame.height) - padding * 2 - buttonHeight

        func addButton(_ title: String) {
            var button: NSButton
            
            button = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.frame = NSRect(x: padding, y: nextY, width: buttonWidth, height: buttonHeight)
            button.bezelStyle = .rounded
            self.view.addSubview(button)

            nextY -= buttonHeight + padding
        }

        addButton("TableView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CodeListController viewDidLoad")
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        switch sender.title {
        case "TableView":
            showViewController(TableViewController(), title: sender.title)
        default:
            print("\(sender.title) clicked")
        }
    }
    
    func showViewController(_ controller: NSViewController, title: String) {
        let window = NSWindow(
            contentRect: .zero,
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = title

        let windowController = NSWindowController(window: window)
        windowController.contentViewController = controller
        WindowLiner(window: windowController.window!).moveToCenter()
        windowController.showWindow(nil)
    }
}

