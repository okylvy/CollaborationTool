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
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @State var todoList:[String] = []
//    @State var todo = ""
    var tasks: [Task] = testDataTasks

    var body: some View {
        NavigationView {
            // .leading で左寄せ
            VStack(alignment: .leading) {
                // TODO list.
                List {
                    ForEach(self.tasks) { task in
                        TaskCell(task: task)
                    }
                    .onDelete { indexSet in
                    }
                }
                .listStyle(PlainListStyle())

                Button(action: {}) {
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
    var task: Task

    var body: some View {
        HStack {
            // TODO task の左の checkbox を表示
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(task.title)
        }
    }
}
