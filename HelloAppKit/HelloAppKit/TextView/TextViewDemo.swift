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
        
        let padding = 20.0
        let spacing = 8.0

        let view = NSView()
        self.view = view

        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        do {
            let textView = NSTextView()
            textView.string = "Hello, World!"
            textView.font = NSFont(name: "Helvetica", size: 24.0)
            textView.widthAnchor.constraint(equalToConstant: 600).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            stack.addArrangedSubview(textView)
        }
        
        do {
            let textView = NSTextView()
            let str = NSMutableAttributedString(string: "Hello attributions!\n")
            str.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: NSColor.brown,
                range: NSRange(location: 6, length: 12)
            )
            textView.textStorage?.setAttributedString(str)
            textView.widthAnchor.constraint(equalToConstant: 600).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            stack.addArrangedSubview(textView)
        }
        
        do {
            let textView = NSTextView()
            let str = NSMutableAttributedString(string: "Hello attributions!\n")
            str.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: NSColor.brown,
                range: NSRange(location: 6, length: 12)
            )
            textView.textStorage?.setAttributedString(str)
            textView.widthAnchor.constraint(equalToConstant: 600).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            stack.addArrangedSubview(textView)
        }
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    /*
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
    */
    
}
