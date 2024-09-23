//
//  TextViewDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/21/24.
//

import AppKit

// Mastering macOS programming-Packt Publishing (2017), 209p

class TextViewDemoController: NSViewController, DemoController {

    static func showDemo() {
        DemoWindowManager.shared.makeWindow("TextView Demo", Self())
    }

    override func loadView() {
        let view = NSView()
        let constraints = ConstraintBuilder()
        
        self.view = view
        
        addStack(to: view) { stack in
            stack.orientation = .vertical
            constraints.appendConstrant(for: stack, stickTo: view)

            let textView = NSTextView()
            textView.string = "Hello, World!"
            textView.font = NSFont(name: "Helvetica", size: 24.0)
            stack.addArrangedSubview(textView)
            constraints.appendConstrant(for: textView, width: 600, height: 200)

            let textView2 = NSTextView()
            let str2 = NSMutableAttributedString(string: "Hello attributions!\n")
            str2.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: NSColor.brown,
                range: NSRange(location: 6, length: 12)
            )
            textView2.textStorage?.setAttributedString(str2)
            stack.addArrangedSubview(textView2)
            constraints.appendConstrant(for: textView2, width: 600, height: 200)
        }
        
        constraints.activate()
    }
    
}
