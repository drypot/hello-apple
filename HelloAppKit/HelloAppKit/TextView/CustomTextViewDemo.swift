//
//  CustomTextViewDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/24/24.
//


import AppKit

// Mastering macOS programming-Packt Publishing (2017), 209p

// 커서가 워프하는 등, 먼가 버그 스럽게 동작하는데, 일단 대강 구경만 하는 것으로.

class CustomTextViewDemoController: NSViewController, DemoViewController {
    
    static func showDemo() {
        DemoWindowManager.shared.makeWindow(title: "CustomTextView Demo", viewController: Self())
    }
    
    var customTextStorage: CustomTextStorage?
    
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
        
        addComponents(stack: stack, padding: padding, spacing: spacing)
        
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(greaterThanOrEqualToConstant: 600),
            stack.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func addComponents(stack: NSStackView, padding: CGFloat, spacing: CGFloat) {
        let container = NSTextContainer()
        container.widthTracksTextView = true
        
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        
        let customTextStorage = CustomTextStorage()
        self.customTextStorage = customTextStorage
        let attrString = NSAttributedString(
            string: "Type some colors here...",
            attributes: [.foregroundColor: NSColor.darkGray]
        )
        customTextStorage.append(attrString)
        customTextStorage.addLayoutManager(layoutManager)
        
        let textView = NSTextView(frame: .zero, textContainer: container)
        textView.font = NSFont.systemFont(ofSize: 24)
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(textView)
    }
        
}

extension CustomTextViewDemoController: NSTextViewDelegate {
    
}
