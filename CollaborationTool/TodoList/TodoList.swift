//
//  TodoList.swift
//  CollaborationTool
//
//  Created by hiroki on 2021/03/20.
//

import SwiftUI

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Fix the specification", completed: false),
    Task(title: "Make design document", completed: false),
    Task(title: "???", completed: false),
    Task(title: "I'm TIRED!!!!", completed: false)
]
#endif

struct TodoList: View {
    var tasks: [Task] = testDataTasks
    @ObservedObject var taskListVM = TodoListViewModel()
    @State var presentAddNewItem = false

    var body: some View {
        NavigationView {
            // .leading で左寄せ
            VStack(alignment: .leading) {
                // TODO list.
                List {
//                    ForEach(self.tasks) { task in
//                        TaskCell(task: task)
                    ForEach (taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    .onDelete { indexSet in
                        self.taskListVM.removeTasks(atOffsets: indexSet)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel.newTask()) { result in
                            if case.success(let task) = result {
                                self.taskListVM.addTask(task: task)
                            }
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                .listStyle(PlainListStyle())

                Button(action: { self.presentAddNewItem.toggle()} ) {
                    HStack {
                        // 元々備わっているボタンイメージ
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        // ボタンの右に文字列を配置
                        Text("Add Task")
                    }
                }
                .padding()  // ボタンの前後に空白を入れる
                .accentColor(Color(UIColor.systemRed))  // Add ボタンを赤色にする
            }
            .navigationBarTitle("TODO")  // 画面上部の文字を表示
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onCommit: (Result<Task, InputError>) -> Void = { _ in }

    var body: some View {
        HStack {
            // TODO task の左の checkbox を表示
//            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            Image(systemName: taskCellVM.completionStateIconName)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("Enter task title", text: $taskCellVM.task.title,
                      onCommit: {
                        if !self.taskCellVM.task.title.isEmpty {
                            self.onCommit(.success(self.taskCellVM.task))
                        } else {
                            self.onCommit(.failure(.empty))
                        }
            }).id(taskCellVM.id)
        }
    }
}

enum InputError: Error {
    case empty
}
