//
//  HomeView.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewStory()
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(1..<10) { _ in
                    VStack {
                        HeaderCellView()
                        FooterCellView()
                    }
                    .padding(.bottom, 12)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Instagram"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.black)
    }
}


