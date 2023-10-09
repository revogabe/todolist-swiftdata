//
//  TodoListApp.swift
//  TodoList
//
//  Created by Daniel Gabriel on 09/10/23.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            TodoView()
                .modelContainer(for: [TodoModel.self])
        }
    }
}
