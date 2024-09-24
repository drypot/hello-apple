//
//  CodeListController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 8/27/24.
//

import Cocoa

class CodeListController: NSViewController {
    
    override func loadView() {

        // 수제 라이브러리 대신 AppKit 기본만 쓰기로 한다.
        // 나중에 AppKit 가이드 쓸 때나 다른 사람들이 학습용도로 보기엔 이게 나을 듯.
        
        let padding = 20.0
        let spacing = 8.0
        
        // 프로퍼티 view 대신 로컬 변수 view 정의해 두고 쓰면 나중에 필요에 따라 리네임하기 편하다.
        // parent 라든지 root 등으로.
        
        let view = NSView()
        self.view = view

        var constraints: [NSLayoutConstraint] = []
        
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        constraints.append(contentsOf: [
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
        
        func addButton(_ title: String) {
            let button: NSButton = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            //button.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(button)
            constraints.append(contentsOf: [
                button.widthAnchor.constraint(equalToConstant: 200),
                //button.heightAnchor.constraint(equalToConstant: 30),
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

