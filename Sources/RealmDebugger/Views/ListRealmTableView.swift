//
//  ListRealmTableView.swift
//  
//
//  Created by Ahmed Ali on 24/05/2024.
//

import RealmSwift
import SwiftUI

@available(iOS 14.0, *)
class ListRealmTableViewModel: ObservableObject {
    @Published var listOfTables: [String] = []
    
    init() {
        do {
            let realm = try Realm()
            let schema = realm.schema
            for objectSchema in schema.objectSchema {
                listOfTables.append(objectSchema.className)
            }
        } catch {
            print(error)
        }
    }
}

@available(iOS 14.0, *)
struct ListRealmTableView: View {
    @StateObject var vm = ListRealmTableViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if let url = Realm.Configuration.defaultConfiguration.fileURL {
                    HeaderView(fileURL: url)
                }
                if vm.listOfTables.isEmpty {
                    Text("No record found")
                } else {
                    ForEach(vm.listOfTables, id: \.self) { table in
                        Text(table)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

@available(iOS 14.0, *)
struct HeaderView: View {
    let fileURL: URL
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fileURL.absoluteString)
        }
        .padding(4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.25))
        )
    }
}

@available(iOS 14.0, *)
struct ListRealmTableRowView: View {
    let tableName: String
    
    var body: some View {
        HStack {
            Text(tableName)
            Spacer()
            Image(systemName: "arrow.forward")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.3))
        )
        .onTapGesture {
            RealmDebugger.presentRealmDebuggerViewForTable(tableName: tableName)
        }
    }
}
