//
//  CustomCompositeView.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import Cocoa

class CustomCompositeView: NSView {
    
    private let childView1 = NSView()
    private let childView2 = NSView()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Set background color for child views for visibility
        childView1.wantsLayer = true
        childView1.layer?.backgroundColor = NSColor.red.cgColor
        
        childView2.wantsLayer = true
        childView2.layer?.backgroundColor = NSColor.green.cgColor
        
        // Add child views to the parent view
        addSubview(childView1)
        addSubview(childView2)
        
        // Define Auto Layout constraints for childView1
        NSLayoutConstraint.activate([
            childView1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            childView1.topAnchor.constraint(equalTo: self.topAnchor),
            childView1.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            childView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        
        // Define Auto Layout constraints for childView2
        NSLayoutConstraint.activate([
            childView2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            childView2.topAnchor.constraint(equalTo: self.topAnchor),
            childView2.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            childView2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
        
}
