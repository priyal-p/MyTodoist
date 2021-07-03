//
//  MyTodoistApp.swift
//  Shared
//
//  Created by Priyal PORWAL on 03/07/21.
//

import SwiftUI

@main
struct MyTodoistApp: App {
    let taskStore = TaskStore()
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView(taskStore: taskStore)
                .frame(minWidth: 200, maxWidth: 300, minHeight: 200, maxHeight: 500)
            #else
            ContentView(taskStore: taskStore)
            #endif
        }
    }
}
