//
//  TodoModel.swift
//  TodoList
//
//  Created by Daniel Gabriel on 09/10/23.
//

import Foundation
import SwiftData

@Model
class TodoModel {
    var name: String
    var check: Bool
    var date: Date

    init(name: String, check: Bool, date: Date) {
        self.name = name
        self.check = check
        self.date = date
    }
}
