//
//  Stacker.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/23/24.
//

import AppKit

func addStack(to parent: NSView, makeSubviews: (NSStackView) -> Void) {
    let stackView = NSStackView()
    if let parentStackView = parent as? NSStackView {
        parentStackView.addArrangedSubview(stackView)
    } else {
        parent.addSubview(stackView)
    }
    makeSubviews(stackView)
}
