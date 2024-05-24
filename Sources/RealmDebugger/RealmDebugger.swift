//
//  RealmDebugger.swift
//
//
//  Created by Ahmed Ali on 24/05/2024.
//

import SwiftUI
import UIKit

@available(iOS 14.0, *)
enum RealmDebugger {
    static func presentRealmDebuggerView() {
        let hostingController = CustomHostingController(rootView: ListRealmTableView())
        hostingController.setTitle("Realm Debugger")
        UIApplication.shared.topViewControllerForRealmDebugger()?.present(UINavigationController(rootViewController: hostingController), animated: true, completion: nil)
    }
    
    static func presentRealmDebuggerViewForTable(tableName: String) {
        let hostingController = CustomHostingController(rootView: RealmTableDetailView(tableName: tableName))
        hostingController.setTitle("Realm Debugger - \(tableName)")
        UIApplication.shared.topViewControllerForRealmDebugger()?.present(UINavigationController(rootViewController: hostingController), animated: true, completion: nil)
    }
}

@available(iOS 14.0, *)
class CustomHostingController<ContentView: View>: UIHostingController<ContentView> {
    func setTitle(_ title: String) {
        navigationItem.title = title
    }
}
