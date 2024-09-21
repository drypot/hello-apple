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

        view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 600))
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.white.cgColor

        var viewLiner = ViewLiner(view)
        
        func addButton(_ title: String) {
            var button: NSButton
            
            button = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            self.view.addSubview(button)
            viewLiner.add(child: button, width: 150)
        }

        addButton("WindowController")
        addButton("WindowBuilder")
        addButton("ViewLiner")
        addButton("TableView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CodeListController viewDidLoad")
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        switch sender.title {
        case "WindowController":
            showWindowControllerDemo()
        case "WindowBuilder":
            showWindowBuilderDemo()
        case "ViewLiner":
            showViewLinerDemo()
        case "TableView":
            showTableViewDemo()
        default:
            print("\(sender.title) clicked")
        }
    }

}

