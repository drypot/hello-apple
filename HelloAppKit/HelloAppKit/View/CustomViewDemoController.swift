//
//  CustomViewDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import AppKit

class CustomViewDemoControllerRunner: SubRunner {
}

class CustomViewDemoController: NSViewController {
    
    let padding: CGFloat = 20.0
    let spacing: CGFloat = 8.0
    
    override func loadView() {
        self.view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = .white
        
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
        do {
            let customView = CustomView(frame: .zero, color: .green)
            customView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(customView)
            
            NSLayoutConstraint.activate([
                customView.heightAnchor.constraint(equalToConstant: 100),
            ])
        }
        
        do {
            let customView = CustomCompositeView()
            customView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(customView)
        }
        
        do {
            let childView = NSView()
            childView.wantsLayer = true
            childView.layer?.backgroundColor = NSColor.red.cgColor
            childView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(childView)
            
            NSLayoutConstraint.activate([
                childView.heightAnchor.constraint(equalToConstant: 100)
            ])
        }

        do {
            let childView = NSView()
            childView.wantsLayer = true
            childView.layer?.backgroundColor = NSColor.blue.cgColor
            childView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(childView)
            
            NSLayoutConstraint.activate([
                childView.heightAnchor.constraint(equalToConstant: 100)
            ])
        }

    }
    
}
