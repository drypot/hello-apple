//
//  ConstraintBuilderDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/21/24.
//

import AppKit

class ConstraintBuilderDemoControllerRunner: SubRunner {
}

class ConstraintBuilderDemoController: NSViewController {

    override func loadView() {
        self.view = NSView()

        let constraints = ConstraintBuilder()

        let stackView = NSStackView()
        stackView.orientation = .vertical
        view.addSubview(stackView)
        constraints.appendConstrant(for: stackView, stickTo: view)
        
        let button1 = NSButton(title: "Button 1", target: nil, action: nil)
        stackView.addArrangedSubview(button1)
        
        let button2 = NSButton(title: "Button 2", target: nil, action: nil)
        stackView.addArrangedSubview(button2)

        let button3 = NSButton(title: "Button 3", target: nil, action: nil)
        stackView.addArrangedSubview(button3)

        constraints.activate()
    }
    
}
