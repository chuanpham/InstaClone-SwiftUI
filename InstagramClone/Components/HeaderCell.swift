//
//  HeaderCell.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import Foundation
import SwiftUI

struct HeaderCellView: View {
    var body: some View {
        VStack {
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
                Image(systemName: "ellipsis")
            }
            .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.size.width)
        }
        .padding(.bottom, 10)
    }
}
