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

class DemoListControllerRunner: SubRunner {
}

class DemoListController: NSViewController {

    let padding: CGFloat = 20.0
    let spacing: CGFloat = 8.0

    override func loadView() {
        self.view = NSView()
        
        let stackView = NSStackView()
        stackView.orientation = .vertical
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        addSubviews(to: stackView)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func addSubviews(to stackView: NSStackView) {
        var constraints: [NSLayoutConstraint] = []
                
        func addButton(_ title: String) {
            let button: NSButton = NSButton(title: title, target: self, action: #selector(buttonClicked))
            button.bezelStyle = .rounded
            //button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
            constraints.append(contentsOf: [
                button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
                button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            ])
        }

        addButton("Window")
        addButton("WindowBuilder")
        addButton("ConstraintBuilder")
        addButton("AddStack")
        addButton("TableView")
        addButton("TextView")
        addButton("CustomTextView")
        addButton("CustomView")
        addButton("GestureRecognizer")
        
        NSLayoutConstraint.activate(constraints)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CodeListController viewDidLoad")
    }
    
    @objc func buttonClicked(_ sender: NSButton) {
        let runnerName = sender.title + "DemoControllerRunner"
        SubRunner.runSubRunner(by: runnerName)
    }

}

