//
//  TaskList.swift
//  MyTodoist
//
//  Created by Priyal PORWAL on 03/07/21.
//

import SwiftUI
struct TaskView: View {
    var title: String
    var body: some View {
        Text(title)
            .padding(.vertical, 4)
            .font(.title3)
    }
}
struct TaskCellPreviews: PreviewProvider {
    static var previews: some View {
        TaskView(title: "Todoist")
    }
}
