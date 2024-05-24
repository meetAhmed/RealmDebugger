//
//  RealmDebugger.swift
//
//
//  Created by Ahmed Ali on 24/05/2024.
//

import SwiftUI
import UIKit

@available(iOS 14.0, *)
public enum RealmDebugger {
    public static func presentRealmDebuggerView(rootViewController: UINavigationController) {
        let hostingController = CustomHostingController(rootView: ListRealmTableView())
        hostingController.setTitle("Realm Debugger")
        rootViewController.present(UINavigationController(rootViewController: hostingController), animated: true, completion: nil)
    }
    
    public static func presentRealmDebuggerView() {
        let hostingController = CustomHostingController(rootView: ListRealmTableView())
        hostingController.setTitle("Realm Debugger")
        UIApplication.shared.topViewControllerForRealmDebugger()?.present(UINavigationController(rootViewController: hostingController), animated: true, completion: nil)
    }
    
    public static func presentRealmDebuggerViewForTable(tableName: String) {
        let hostingController = CustomHostingController(rootView: RealmTableDetailView(tableName: tableName))
        hostingController.setTitle("Realm Debugger - \(tableName)")
        UIApplication.shared.topViewControllerForRealmDebugger()?.present(UINavigationController(rootViewController: hostingController), animated: true, completion: nil)
    }
}

@available(iOS 14.0, *)
class CustomHostingController<ContentView: View>: UIHostingController<ContentView> {
    func setTitle(_ title: String) {
        navigationItem.title = title
        
        let closeBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .done,
            target: self,
            action: #selector(self.dismissView)
        )
        
        navigationItem.rightBarButtonItem = closeBarButtonItem
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
}
