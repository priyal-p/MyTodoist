//
//  TaskStore.swift
//  MyTodoist
//
//  Created by Priyal PORWAL on 03/07/21.
//

import Foundation
class TaskStore: ObservableObject {
    @Published private(set) var tasks: [Task] = [] // {
//        didSet {
//            #warning("Just for testing purposes")
//            print("Added new item \(tasks.count) \n \(tasks)")
//        }
//    }
    
    init() {
        loadTasks()
    }
    
    var filePath: URL {
        let fileManager = FileManager.default
        let documentDirectories = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let myDocumentDirectory = documentDirectories.first!
        let tasksFileURL = myDocumentDirectory.appendingPathComponent("task.json")
        print(tasksFileURL.relativePath)
        return tasksFileURL
    }
    
    func add(_ task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    func remove(_ task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)
        }
        saveTasks()
    }
    
    private func saveTasks() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(tasks)
            try data.write(to: filePath)
            print("Saved \(tasks.count) to \(filePath.relativePath)")
        } catch {
            print("Error occured while Saving Data \(error)")
        }
    }
    
    private func loadTasks() {
        do {
            let data = try Data(contentsOf: filePath)
            let decoder = JSONDecoder()
            self.tasks = try decoder.decode([Task].self, from: data)
            print("Loaded \(tasks.count) from path: \n \(filePath.relativePath)")
        } catch {
            print("Error Decoding Data: \(error)")
        }
    }
}

// MARK:- Using Compiler Control Statements
#if DEBUG
extension TaskStore {
    static var sample: TaskStore {
        let tasks = [Task(title: "Try Operations"),
                     Task(title: "Try Image Download App with Caching Support"),
                     Task(title: "Revise Highlighted Text in Books")]
        let store = TaskStore()
        store.tasks = tasks
        return store
    }
}
#endif
