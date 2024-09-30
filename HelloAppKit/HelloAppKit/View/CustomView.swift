//
//  CustomView.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/30/24.
//

import Cocoa

class CustomView: NSView {

    var color: NSColor

    init(color: NSColor = .blue) {
        self.color = color
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        color.setFill()
        dirtyRect.fill()
    }
    
    override func mouseDown(with event: NSEvent) {
        print("CustomView \(color) clicked")
    }
    
}
