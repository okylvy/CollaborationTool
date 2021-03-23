//
//  TodoListViewModel.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/23.
//

import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()

    init() {
        self.taskCellViewModels = testDataTasks.map { task in
            TaskCellViewModel(task: task)
        }
    }

    func removeTasks(atOffsets indexSet: IndexSet) {
        taskCellViewModels.remove(atOffsets: indexSet)
    }

    func addTask(task: Task) {
        taskCellViewModels.append(TaskCellViewModel(task: task))
    }
}
