//
//  StackerDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

func showStackerDemo() {
    WindowBuilder(title: "Stacker", viewController: StackerDemoController()).showAtCenter().retainWindow()
}

class StackerDemoController: NSViewController {

    override func loadView() {
        
        view = NSView()

        let constraints = ConstraintBuilder()

        addStack(parent: view) { stack in
            stack.orientation = .vertical
            constraints.addFillParent(parent: view, child: stack)
            
            addStack(parent: stack) { stack in
                stack.orientation = .vertical

                let button1 = NSButton(title: "Button 1", target: nil, action: nil)
                stack.addArrangedSubview(button1)
                
                let button2 = NSButton(title: "Button 2", target: nil, action: nil)
                stack.addArrangedSubview(button2)

                let button3 = NSButton(title: "Button 3", target: nil, action: nil)
                stack.addArrangedSubview(button3)
            }
            
            addStack(parent: stack) { stack in
                let button4 = NSButton(title: "Button 4", target: nil, action: nil)
                stack.addArrangedSubview(button4)
                
                let button5 = NSButton(title: "Button 5", target: nil, action: nil)
                stack.addArrangedSubview(button5)

                let button6 = NSButton(title: "Button 6", target: nil, action: nil)
                stack.addArrangedSubview(button6)
            }
        }

        constraints.activate()
        
        
        /*
        let group2 = NSView()
        let groupLiner2 = ViewLiner(group2).setPadding(0).setDirection(.horizontal)
        
        let button4 = NSButton(title: "Button 4", target: nil, action: nil)
        group2.addSubview(button4)
        groupLiner2.lineUpSubview(button4)

        let button5 = NSButton(title: "Button 5", target: nil, action: nil)
        group2.addSubview(button5)
        groupLiner2.lineUpSubview(button5)

        let button6 = NSButton(title: "Button 6", target: nil, action: nil)
        group2.addSubview(button6)
        groupLiner2.lineUpSubview(button6)
        
        view.addSubview(group2)
        viewLiner.lineUpSubview(group2)
*/

    }
    
}
