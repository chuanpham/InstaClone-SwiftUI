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
        TabView {
            HomeView().tabItem { Image(systemName: "house.fill") }.tag(0)
            Text("").tabItem { Image(systemName: "magnifyingglass") }.tag(1)
            Text("").tabItem { Image(systemName: "camera.viewfinder") }.tag(2)
            Text("").tabItem { Image(systemName: "heart.fill") }.tag(3)
            Text("").tabItem { Image(systemName: "person.fill") }.tag(4)
        }
    }
}
