//
//  ViewLinerDemoController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/21/24.
//

import AppKit

class ViewLinerDemoController: NSViewController {

    override func loadView() {        
        view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 600))
        
        let button1 = NSButton(title: "Button 1", target: nil, action: nil)
        let button2 = NSButton(title: "Button 2", target: nil, action: nil)
        let button3 = NSButton(title: "Button 3", target: nil, action: nil)
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        var viewLiner = ViewLiner(self.view)
        viewLiner.add(child: button1)
        viewLiner.add(child: button2)
        viewLiner.add(child: button3)
    }
    
}

func showViewLinerDemo() {
    WindowBuilder(title: "View Liner", viewController: ViewLinerDemoController()).showAtCenter().retainWindow()
}
