//
//  SwiftUIView.swift
//  
//
//  Created by Ahmed Ali on 24/05/2024.
//

import RealmSwift
import SwiftUI

@available(iOS 14.0, *)
class RealmTableDetailViewModel: ObservableObject {
    let tableName: String
    @Published var data: [String] = []
    
    init(tableName: String) {
        self.tableName = tableName
        fetchAllObjects(tableName: tableName)
    }
    
    func fetchAllObjects(tableName: String) {
        do {
            let realm = try Realm()
            let moduleName = Bundle.main.infoDictionary!["CFBundleName"] as! String
            let className = "\(moduleName).\(tableName)"
            if let objectType = NSClassFromString(className) as? Object.Type {
                let objects = realm.objects(objectType)
                for object in objects {
                    data.append("\(object.description)")
                }
            }
        } catch {
            print(error)
        }
    }
}

@available(iOS 14.0, *)
struct RealmTableDetailView: View {
    @StateObject var vm: RealmTableDetailViewModel
    
    init(tableName: String) {
        _vm = StateObject(wrappedValue: RealmTableDetailViewModel(tableName: tableName))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Count: \(vm.data.count)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(vm.data, id: \.self) { object in
                    RealmTableDetailRowView(data: object)
                }
            }
        }
        .padding()
    }
}

@available(iOS 14.0, *)
struct RealmTableDetailRowView: View {
    let data: String
    
    var body: some View {
        VStack {
            Text(data)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.25))
        )
    }
}
