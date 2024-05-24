//
//  TaskModel.swift
//  Example
//
//  Created by Ahmed Ali on 24/05/2024.
//

import RealmSwift

class TaskModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
}
