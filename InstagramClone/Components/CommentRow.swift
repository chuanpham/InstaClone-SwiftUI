//
//  CommentRow.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import SwiftUI

struct CommentRow: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .clipShape(Circle())
                .frame(width: 35, height: 35)
            VStack(alignment: .leading) {
                Text("David Plane").bold()
                Text("VietNam").font(.caption)
            }
            Spacer()
            Text("1 day ago")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.trailing, 12)
        .padding(.leading, 12)
    }
}
