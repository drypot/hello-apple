//
//  GestureRecognizerDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import AppKit

class GestureRecognizerDemoRunner: SubRunner {
}

class GestureRecognizerDemoController: NSViewController {
    
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
        let childView1 = NSView()
        childView1.wantsLayer = true
        childView1.layer?.backgroundColor = NSColor.red.cgColor
        childView1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(childView1)
        
        NSLayoutConstraint.activate([
            childView1.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            childView1.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
        
        let clickGestureRecognizer = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
        childView1.addGestureRecognizer(clickGestureRecognizer)
    }

    @objc func handleClick(_ sender: NSClickGestureRecognizer) {
        let locationInView = sender.location(in: sender.view)
        print("Mouse clicked at: \(locationInView)")
    }

}
