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
        DemoWindowManager.shared.makeWindow(title: "TextView Demo", viewController: Self())
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
            textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stack.addArrangedSubview(textView)
        }
        
        do {
            let str1 = NSMutableAttributedString(string: "Hello attributions!\n")
            str1.addAttribute(.foregroundColor, value: NSColor.brown, range: NSRange(location: 6, length: 12))

            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: NSColor.darkGray,
                .backgroundColor: NSColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0),
                .font: NSFont(name: "Courier", size: 18.0)! /* Optional 들은 꼭 벗겨서 넣어야 한다 */
            ]
            let str2 = NSMutableAttributedString(string: "Great to be here\n", attributes: attributes)
            str1.append(str2)
            
            let linkAttributes: [NSAttributedString.Key: Any] = [.link: "http://www.grimshaw.de"]
            let str3 = NSMutableAttributedString(string: "Click me\n", attributes: linkAttributes)
            str1.append(str3)
            
            
            let emphasisTextAttributes: [NSAttributedString.Key: Any] = [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle,
                .foregroundColor: NSColor.black,
                .strokeWidth : 2.0
            ]
            let str4 = NSMutableAttributedString(string: "Great to be here\n")
            str4.addAttributes(emphasisTextAttributes, range: NSRange(location: 9, length: 2))
            str1.append(str4)
            
            let str5 = NSMutableAttributedString(string: "Great to be here\n")
            let myShadow = NSShadow()
            myShadow.shadowBlurRadius = 1
            myShadow.shadowOffset = CGSize(width: 8, height: -8)
            myShadow.shadowColor = NSColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
            str5.addAttribute(.shadow, value: myShadow, range: NSRange(location: 0, length: 8))
            str1.append(str5)

            str1.addAttribute(.font, value: NSFont.systemFont(ofSize: 32), range: NSRange(location: 0, length: str1.length))
            
            let textView = NSTextView()
            textView.textStorage?.setAttributedString(str1)
            
            textView.widthAnchor.constraint(equalToConstant: 600).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 300).isActive = true
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
