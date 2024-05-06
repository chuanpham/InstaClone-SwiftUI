//
//  Initial.swift
//  InstagramClone
//
//  Created by chuanpham on 12/04/2024.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var session: SessionStore
    
    func listenAuthState() {
        session.listenAuthState()
    }
    
    var body: some View {
        Group {
            if session.isLoggedIn {
                MainView()
            } else {
                SignInView()
            }
        }
        .onAppear(perform: listenAuthState)
    }
}
