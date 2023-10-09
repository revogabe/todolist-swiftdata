//
//  ContentView.swift
//  TodoList
//
//  Created by Daniel Gabriel on 09/10/23.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Query(filter: #Predicate { $0.check == false } ,sort: \TodoModel.date) private var todoUncheck: [TodoModel]
    @Query(filter: #Predicate { $0.check == true } ,sort: \TodoModel.date) private var todoCheck: [TodoModel]
    @Environment(\.modelContext) private var context
    @State private var taskText: String = ""
    @State private var toogle: Bool = false

    var body: some View {
        VStack {
            TextField("Tarefa", text: $taskText)
                .onSubmit {
                    let todo = TodoModel(name: taskText, check: false, date: Date())
                    context.insert(todo)
                    taskText = ""
                }
                .padding()
            List {
                ForEach(todoUncheck) { todo in
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(todo.check ? Color(.blue) : Color(.gray).opacity(0.2))

                            if todo.check {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12))
                            }
                        }

                        Text(todo.name)
                            .strikethrough(todo.check ? true : false)
                    }
                    .onTapGesture {
                            todo.check.toggle()
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(todoUncheck[index])
                    }
                })
                ForEach(todoCheck) { todo in
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(todo.check ? Color(.blue) : Color(.gray).opacity(0.2))

                            if todo.check {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12))
                            }
                        }

                        Text(todo.name)
                            .strikethrough(todo.check ? true : false)
                    }
                    .onTapGesture {
                            todo.check.toggle()
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(todoCheck[index])
                    }
                })
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    TodoView()
}
