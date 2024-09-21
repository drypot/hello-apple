//
//  LayoutUtil.swift
//
//  Created by Kyuhyun Park on 7/11/24.
//

import Cocoa

struct ViewLiner {
    
    private let view: NSView
    private let padding: CGFloat
    private let spacing: CGFloat
    private var lastChild: NSView?
    
    init(_ view: NSView, padding: CGFloat = 20, spacing: CGFloat = 8) {
        self.view = view
        self.padding = padding
        self.spacing = spacing
    }
    
    func fill(withChild child: NSView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        child.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
        child.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        child.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        child.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
    }
    
    mutating func add(child: NSView, width: CGFloat = 100, height: CGFloat = 30) {
        child.translatesAutoresizingMaskIntoConstraints = false
        
        if let lastChild {
            child.topAnchor.constraint(equalTo: lastChild.bottomAnchor, constant: spacing).isActive = true
        } else {
            child.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
        }
        child.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        //child.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        child.widthAnchor.constraint(equalToConstant: width).isActive = true
        child.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.lastChild = child
    }
    
    /*
    func stickTopTo(_ other: NSView, padding: CGFloat) {
        view.topAnchor.constraint(equalTo: other.topAnchor, constant: padding).isActive = true
    }
    
    func alignXCenterTo(_ other: NSView) {
        view.centerXAnchor.constraint(equalTo: other.centerXAnchor).isActive = true
    }
    
    func alignYCenterTo(_ other: NSView) {
        view.centerYAnchor.constraint(equalTo: other.centerYAnchor).isActive = true
    }
    */
}
