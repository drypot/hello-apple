//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 9/17/24.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup("Main Window") {
            DemoListView()
        }

        DemoWindowGroup {
            ContentViewTwo()
        }

        DemoWindowGroup {
            ContentViewThree()
        }

    }
}

struct DemoWindowGroupList {
    static var typeNames: [String] = []
}

struct DemoWindowGroup<Content: View>: Scene {
    let content: Content
    var typeName: String { String(describing: Content.self) }

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        DemoWindowGroupList.typeNames.append(typeName)
    }

    var body: some Scene {
        WindowGroup(typeName, id: typeName) {
            content
        }
    }
}

struct DemoListView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack {
            ForEach(DemoWindowGroupList.typeNames.indices, id: \.self) { index in
                let typeName = DemoWindowGroupList.typeNames[index]

                Button {
                    openWindow(id: typeName)
                } label: {
                    Text(typeName)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)

            }
        }
//        .frame(maxWidth: .infinity, alignment: .top)
    }
}

struct ContentViewTwo: View {
    var body: some View {
        Text("This is the second window!")
            .padding()
    }
}

struct ContentViewThree: View {
    var body: some View {
        Text("This is the third window!")
            .padding()
    }
}
