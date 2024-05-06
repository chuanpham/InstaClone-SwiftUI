//
//  CommentView.swift
//  InstagramClone
//
//  Created by chuanpham on 06/05/2024.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(1..<10) { _ in
                    CommentRow()
                }
            }
            CommentInput()
        }
    }
}
