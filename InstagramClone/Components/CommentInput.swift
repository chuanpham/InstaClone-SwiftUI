//
//  CommentInput.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import SwiftUI

struct CommentInput: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("avatar")
                .resizable()
                .clipShape(Circle())
                .frame(width: 45, height: 45)
                .padding(.leading, 12)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
                    .padding()
                HStack {
                    TextField("Add a comment", text: .constant(""))
                        .padding(30)
                    Button(action: {}) {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                            .imageScale(.large)
                            .padding(30)
                    }
                }
            }
            .frame(height: 70)
        }
    }
}

#Preview {
    CommentInput()
}
