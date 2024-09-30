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
        self.view = view
        
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        addSubviews(to: stack)
        
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(greaterThanOrEqualToConstant: 600),
            stack.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func addSubviews(to stack: NSStackView) {
        let customView = CustomView()
        stack.addArrangedSubview(customView)
    }
        
}
