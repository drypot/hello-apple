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

class DemoListRunner: SubRunner {
}

class DemoListController: NSViewController {

    let padding: CGFloat = 20.0
    let spacing: CGFloat = 8.0

    var subRunners = [String: SubRunner.Type]()
    
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
            stackView.addArrangedSubview(button)
            constraints.append(contentsOf: [
                button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            ])
        }

        subclasses(of: SubRunner.self)
            .filter {
                $0 != DemoListRunner.self
            }
            .sorted {
                $0.className() < $1.className()
            }
            .forEach { subRunnerType in
                let className = String(subRunnerType.className().split(separator: ".").last!)
                let buttonTitle = className.dropSuffix("Runner").dropSuffix("Controller").dropSuffix("Demo")
                subRunners[buttonTitle] = subRunnerType
                addButton(buttonTitle)
            }
        
        NSLayoutConstraint.activate(constraints)
    }
        
    @objc func buttonClicked(_ sender: NSButton) {
        let subRunnerType = subRunners[sender.title]!
        subRunnerType.init().run()
    }

}

