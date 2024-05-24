//
//  File.swift
//  
//
//  Created by Ahmed Ali on 24/05/2024.
//

import SwiftUI
import UIKit

extension UIWindow {
    override open func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if #available(iOS 14.0, *) {
                RealmDebugger.presentRealmDebuggerView()
            } else {
                // Fallback on earlier versions
            }
        } else {
            super.motionEnded(motion, with: event)
        }
    }
}
