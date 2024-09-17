//
//  LayoutUtil.swift
//
//  Created by Kyuhyun Park on 7/11/24.
//

import Cocoa

struct ViewLiner {
    
    let view: NSView
    
    func stickEdgesTo(_ container: NSView, padding: CGFloat = 0) {
        view.topAnchor.constraint(equalTo: container.topAnchor, constant: padding).isActive = true
        view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding).isActive = true
        view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding).isActive = true
        view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding).isActive = true
    }
    
    func stickEdgesTo(_ container: NSView, after previousView: NSView, padding: CGFloat = 0 ) {
        view.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: padding).isActive = true
        view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding).isActive = true
        view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding).isActive = true
        view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding).isActive = true
    }
    
    func stickTopTo(_ other: NSView, padding: CGFloat) {
        view.topAnchor.constraint(equalTo: other.topAnchor, constant: padding).isActive = true
    }
    
    func alignXCenterTo(_ other: NSView) {
        view.centerXAnchor.constraint(equalTo: other.centerXAnchor).isActive = true
    }
    
    func alignYCenterTo(_ other: NSView) {
        view.centerYAnchor.constraint(equalTo: other.centerYAnchor).isActive = true
    }
    
}
