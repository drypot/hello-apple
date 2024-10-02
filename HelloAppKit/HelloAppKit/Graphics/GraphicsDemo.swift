//
//  GraphicsDemo.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import AppKit

class GraphicsDemoRunner: SubRunner {
}

class GraphicsDemoController: NSViewController {
    
    let padding: CGFloat = 20.0
    let spacing: CGFloat = 8.0
    
    override func loadView() {
        self.view = NSView()
        
        let stackView = NSStackView()
        stackView.orientation = .horizontal
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
            let button = GraphicButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 200),
            ])
        }

        do {
            let button = GraphicButton()
            button.roundIcon = false
            button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 200),
            ])
        }

        do {
            let clock = DialClock()
            clock.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(clock)
            
            NSLayoutConstraint.activate([
                clock.widthAnchor.constraint(equalToConstant: 200),
                clock.heightAnchor.constraint(equalToConstant: 200),
            ])
        }
        
    }
    
}
