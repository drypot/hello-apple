//
//  ConstraintBuilderDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/21/24.
//

import AppKit

class ConstraintBuilderDemoController: NSViewController, DemoController {

    static func showDemo() {
        DemoWindowManager.shared.makeWindow("ConstraintBuilder Demo", Self())
    }
    
    override func loadView() {
        
        view = NSView()

        let constraints = ConstraintBuilder()

        let stack = NSStackView()
        stack.orientation = .vertical
        view.addSubview(stack)
        constraints.addFillParent(parent: view, child: stack)
        
        let button1 = NSButton(title: "Button 1", target: nil, action: nil)
        stack.addArrangedSubview(button1)
        
        let button2 = NSButton(title: "Button 2", target: nil, action: nil)
        stack.addArrangedSubview(button2)

        let button3 = NSButton(title: "Button 3", target: nil, action: nil)
        stack.addArrangedSubview(button3)

        constraints.activate()
    }
    
}
