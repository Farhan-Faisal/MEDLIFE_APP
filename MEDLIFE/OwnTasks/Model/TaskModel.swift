//
//  TaskModel.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-07.
//

import Foundation

struct TaskModel: Identifiable, Codable, Hashable {
    var id: String
    var execID: String
    var name: String
    var deadline: Date
    var description: String
    var completed: Bool
    var approved: Bool
}
