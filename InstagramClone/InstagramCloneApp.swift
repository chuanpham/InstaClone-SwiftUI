//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by chuanpham on 09/04/2024.
//

import SwiftUI
import FirebaseCore

@main
struct InstagramCloneApp: App {
    
    init() {
       FirebaseApp.configure()
     }

    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                SignInView()
            }
            .accentColor(.black)
        }
    }
}
