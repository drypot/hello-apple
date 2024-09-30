//
//  CodeListController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/27/24.
//

import Cocoa

// 수제 라이브러리 대신 AppKit 기본만 쓰기로 한다.
// 나중에 AppKit 가이드 쓸 때나 다른 사람들이 학습용도로 보기엔 이게 나을 듯.
// 파일에 반복적으로 중복된 코드가 나타나도 나중에 한눈에 쭉 읽기 편하게 그대로 두는 것도 괜찮은 듯.

class CodeListController: NSViewController {
    
    override func loadView() {
        let padding = 20.0
        let spacing = 8.0
        
        let view = NSView()
        self.view = view
        
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        addComponents(stack: stack, padding: padding, spacing: spacing)
        
        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            stack.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func addComponents(stack: NSStackView, padding: CGFloat, spacing: CGFloat) {
        var constraints: [NSLayoutConstraint] = []
                
        func addButton(_ title: String) {
            let button: NSButton = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            //button.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(button)
            constraints.append(contentsOf: [
                button.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 0),
                button.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: 0),
            ])
        }

        addButton("Window")
        addButton("WindowBuilder")
        addButton("ConstraintBuilder")
        addButton("AddStack")
        addButton("TableView")
        addButton("TextView")
        addButton("CustomTextView")
        
        NSLayoutConstraint.activate(constraints)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CodeListController viewDidLoad")
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        let moduleName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        let typeName = moduleName + "." + sender.title + "DemoController"
        guard let demoType = NSClassFromString(typeName) as? DemoController.Type else {
            print("demo type not found for \(typeName)")
            return
        }
        demoType.showDemo()
    }

}

