//
//  MainView.swift
//  InstagramClone
//
//  Created by chuanpham on 12/04/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    
    func logOut() {
        session.logOut()
    }
    
    var body: some View {
        VStack {
            if session.userSession == nil {
                ProgressView()
            } else {
                Text(session.userSession!.email)
            }
            Button(action: logOut, label: {
                Text("Log Out")
            })
        }

    }
}
