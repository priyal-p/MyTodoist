//
//  NewTaskView.swift
//  MyTodoist
//
//  Created by Priyal PORWAL on 03/07/21.
//

import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    @State var enteredTask: String = ""
    var body: some View {
        HStack {
            TextField("Enter TODO Task", text: $enteredTask)
            Button("Add Task") {
                let task = Task(title: enteredTask)
                taskStore.add(task)
                enteredTask = ""
            }.disabled(enteredTask.isEmpty)
        }.padding(5)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore.sample)
    }
}
