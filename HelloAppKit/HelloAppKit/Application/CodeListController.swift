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

        view = NSView()

        let constraints = ConstraintBuilder()

        let stackView = NSStackView()
        stackView.orientation = .vertical
        view.addSubview(stackView)
        constraints.addFillParent(parent: view, child: stackView)
        
        func addButton(_ title: String) {
            let button: NSButton = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            stackView.addArrangedSubview(button)
        }

        addButton("WindowController")
        addButton("WindowBuilder")
        addButton("ConstraintBuilder")
        addButton("Stacker")
        addButton("TableView")
        addButton("TextView")
        
        constraints.activate()
    }
    
    /*
    func loadView() {
        print("CodeListController loadView")

        view = NSView()
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.white.cgColor

        let viewLiner = ViewLiner(view)
        
        func addButton(_ title: String) {
            var button: NSButton
            
            button = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            self.view.addSubview(button)
            viewLiner.lineUpSubview(button, width: 150)
        }

        addButton("WindowController")
        addButton("WindowBuilder")
        addButton("ViewLiner")
        addButton("TableView")
        addButton("TextView")
    }
    */
    
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
        case "ConstraintBuilder":
            showConstraintBuilderDemo()
        case "Stacker":
            showStackerDemo()
        case "TableView":
            showTableViewDemo()
        case "TextView":
            showTextViewDemo()
        default:
            print("\(sender.title) clicked")
        }
    }

}

