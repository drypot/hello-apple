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
        view = NSView()

        let padding = 20.0
        let spacing = 10.0

        let stackView = NSStackView()
        stackView.orientation = .vertical
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
        
        let textView = NSTextView()
        textView.string = "Hello, World!"
        textView.font = NSFont(name: "Helvetica", size: 24.0)
        stackView.addArrangedSubview(textView)
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalToConstant: 600),
            textView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        let textView2 = NSTextView()
        let str2 = NSMutableAttributedString(string: "Hello attributions!\n")
        str2.addAttribute(NSAttributedString.Key.foregroundColor,
                          value: NSColor.brown,
                          range: NSRange(location: 6, length: 12))
        textView2.textStorage?.setAttributedString(str2)
        stackView.addArrangedSubview(textView2)
        NSLayoutConstraint.activate([
            textView2.widthAnchor.constraint(equalToConstant: 600),
            textView2.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}
