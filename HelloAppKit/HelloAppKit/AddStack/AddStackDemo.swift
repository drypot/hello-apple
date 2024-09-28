//
//  StackerDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

class AddStackDemoController: NSViewController, DemoController {

    static func showDemo() {
        DemoWindowManager.shared.makeWindow(title: "Add Stack Demo", viewController: Self())
    }
    
    override func loadView() {
        let view = NSView()
        self.view = view

        let constraints = ConstraintBuilder()

        addStack(to: view) { stack in
            stack.orientation = .vertical
            constraints.appendConstrant(for: stack, stickTo: view)
            
            addStack(to: stack) { stack in
                stack.orientation = .vertical

                let button1 = NSButton(title: "Button 1", target: nil, action: nil)
                stack.addArrangedSubview(button1)
                
                let button2 = NSButton(title: "Button 2", target: nil, action: nil)
                stack.addArrangedSubview(button2)

                let button3 = NSButton(title: "Button 3", target: nil, action: nil)
                stack.addArrangedSubview(button3)
            }
            
            addStack(to: stack) { stack in
                let button4 = NSButton(title: "Button 4", target: nil, action: nil)
                stack.addArrangedSubview(button4)
                
                let button5 = NSButton(title: "Button 5", target: nil, action: nil)
                stack.addArrangedSubview(button5)

                let button6 = NSButton(title: "Button 6", target: nil, action: nil)
                stack.addArrangedSubview(button6)
            }
        }

        constraints.activate()
    }
    
}
