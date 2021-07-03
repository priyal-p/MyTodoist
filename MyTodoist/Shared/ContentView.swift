//
//  ContentView.swift
//  Shared
//
//  Created by Priyal PORWAL on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    var taskStore: TaskStore
    
    var body: some View {
        VStack {
            NewTaskView(taskStore: taskStore)
            TaskListView(taskStore: taskStore)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: .sample)
    }
}
