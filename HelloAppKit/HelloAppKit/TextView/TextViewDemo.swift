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
        
        // 수제 라이브러리 대신 AppKit 기본만 쓰기로 한다.
        // 나중에 AppKit 가이드 쓸 때나 다른 사람들이 학습용도로 보기엔 이게 나을 듯.

        let padding = 20.0
        let spacing = 8.0

        let view = NSView()
        self.view = view

        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        let textView = NSTextView()
        textView.string = "Hello, World!"
        textView.font = NSFont(name: "Helvetica", size: 24.0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textView)

        let textView2 = NSTextView()
        let str2 = NSMutableAttributedString(string: "Hello attributions!\n")
        str2.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: NSColor.brown,
            range: NSRange(location: 6, length: 12)
        )
        textView2.textStorage?.setAttributedString(str2)
        textView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textView2)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            textView.widthAnchor.constraint(equalToConstant: 600),
            textView.heightAnchor.constraint(equalToConstant: 200),

            textView2.widthAnchor.constraint(equalToConstant: 600),
            textView2.heightAnchor.constraint(equalToConstant: 200),
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
