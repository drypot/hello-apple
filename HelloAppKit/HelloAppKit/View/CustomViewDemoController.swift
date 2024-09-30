//
//  CustomViewDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import AppKit

class CustomViewDemoController: NSViewController, DemoViewController {
    
    let padding: CGFloat = 20.0
    let spacing: CGFloat = 8.0
    
    static func showDemo() {
        DemoWindowManager.shared.makeWindow(title: "CustomView Demo", viewController: Self())
    }
    
    override func loadView() {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = .white
        self.view = view
        
        let stackView = NSStackView()
        stackView.orientation = .vertical
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        addSubviews(to: stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 600),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func addSubviews(to stackView: NSStackView) {
//        do {
//            let customView = CustomView(color: .blue)
//            customView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(customView)
//            
//            NSLayoutConstraint.activate([
//                customView.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
//                customView.heightAnchor.constraint(equalToConstant: 100),
//            ])
//        }
        
//        do {
//            let textView = NSTextView()
//            textView.string = "Hello, World!"
//            textView.font = NSFont(name: "Helvetica", size: 24.0)
//            stackView.addArrangedSubview(textView)
//            
//            NSLayoutConstraint.activate([
//                textView.widthAnchor.constraint(greaterThanOrEqualToConstant: 600),
//                textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
//            ])
//        }

//        do {
//            let customView = CustomCompositeView()
//            customView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(customView)
//        }
        
        do {
            let childView = NSView()
            childView.wantsLayer = true
            childView.layer?.backgroundColor = NSColor.red.cgColor
            
            // Add the subview to the stack view
            stackView.addArrangedSubview(childView)
            
            // Set height constraint for the subview
            childView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                childView.heightAnchor.constraint(equalToConstant: 100)
            ])
        }

    }
    
}
