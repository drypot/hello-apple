//
//  ConstraintBuilderDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/21/24.
//

import AppKit

func showConstraintBuilderDemo() {
    WindowBuilder(title: "View Liner", viewController: ConstraintBuilderDemoController()).showAtCenter().retainWindow()
}

class ConstraintBuilderDemoController: NSViewController {

    override func loadView() {
        
        view = NSView()

        let constraints = ConstraintBuilder()

        let stackView = NSStackView()
        stackView.orientation = .vertical
        view.addSubview(stackView)
        constraints.addFillParent(parent: view, child: stackView)
        
        let button1 = NSButton(title: "Button 1", target: nil, action: nil)
        stackView.addArrangedSubview(button1)
        
        let button2 = NSButton(title: "Button 2", target: nil, action: nil)
        stackView.addArrangedSubview(button2)

        let button3 = NSButton(title: "Button 3", target: nil, action: nil)
        stackView.addArrangedSubview(button3)

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
