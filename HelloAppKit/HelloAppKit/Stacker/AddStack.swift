//
//  Stacker.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

func addStack(parent: NSView, makeSubviews: (NSStackView) -> Void) {
    let stack = NSStackView()
    if let parentStack = parent as? NSStackView {
        parentStack.addArrangedSubview(stack)
    } else {
        parent.addSubview(stack)
    }
    makeSubviews(stack)
}
