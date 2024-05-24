//
//  ContentView.swift
//  Example
//
//  Created by Ahmed Ali on 24/05/2024.
//

import SwiftUI
import RealmSwift
import RealmDebugger

class DatabaseManager {
    init() {
        do {
            let realm = try Realm()
            
            let animalModel1 = AnimalModel()
            animalModel1.name = "Dog"
            
            let animalModel2 = AnimalModel()
            animalModel2.name = "Cat"
            
            let animalModel3 = AnimalModel()
            animalModel3.name = "Horse"
            
            let countryModel1 = CountryModel()
            countryModel1.name = "Argentina"
            countryModel1.capital = "Buenos Aires"
            
            let countryModel2 = CountryModel()
            countryModel2.name = "Brazil"
            countryModel2.capital = "Brasília"
            
            let taskModel1 = TaskModel()
            taskModel1.name = "Do 30 mins of yoga"
            
            try realm.write {
                realm.add(animalModel1)
                realm.add(animalModel2)
                realm.add(animalModel3)
                realm.add(countryModel1)
                realm.add(countryModel2)
                realm.add(taskModel1)
            }
        } catch {
            print(error)
        }
    }
}

struct ContentView: View {
    private var manager = DatabaseManager()
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            Button("Open Realm Debug View") {
                RealmDebugger.presentRealmDebuggerView()
            }
        }
    }
}
