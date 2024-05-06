//
//  ScrollViewStory.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import SwiftUI

struct ScrollViewStory: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(1..<10) { _ in
                    VStack {
                        Image("avatar")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .overlay(Circle().inset(by: -2.5).stroke())
                        Text("Story")
                            .font(.footnote)
                    }
                }
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            Image(systemName: "plus.app.fill")
                .position(x: 50, y: -35)
        }
        .frame(height: 90)
    }
}
