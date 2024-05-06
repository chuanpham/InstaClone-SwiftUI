//
//  FooterCell.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import Foundation
import SwiftUI

struct FooterCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: "heart")
                NavigationLink(destination: CommentView()) {
                    Image(systemName: "bubble.left")
                        .renderingMode(.original)
                        .foregroundColor(.black)
                }
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            
            HStack {
                Text("David Plain")
                    .font(.subheadline).bold()
                Text("Purple blink")
                    .font(.subheadline)
            }
            
            NavigationLink(destination: CommentView()) {
                Text("View all comments")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            
            HStack {
                Image("avatar")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 24, height: 24)
                Text("Leave a comment")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Text("1 day ago")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
}
