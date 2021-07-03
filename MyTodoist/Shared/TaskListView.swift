//
//  TaskListView.swift
//  MyTodoist
//
//  Created by Priyal PORWAL on 03/07/21.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore
    var body: some View {
        List {
            ForEach(taskStore.tasks) { task in
                #if os(macOS)
                TaskView(title: task.title)
                    .contextMenu(menuItems: {
                    Button("Delete") {
                        taskStore.remove(task)
                    }
                })
                #else
                TaskView(title: task.title)
                #endif
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let task = taskStore.tasks[index]
                    taskStore.remove(task)
                }
            })
        }.animation(.easeIn)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskStore: TaskStore.sample)
    }
}
