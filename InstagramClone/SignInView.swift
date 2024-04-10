//
//  ContentView.swift
//  InstagramClone
//
//  Created by chuanpham on 09/04/2024.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
            
            EmailTextField(email: $email)
            
            PasswordTextField(password: $password)
            
            SignInButton(action: {})
            
            NavigationLink(destination: SignUpView()) {
                SignUpSection()
            }
        }
    }
}

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField("Email", text: $email)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
            .padding()
    }
}

struct PasswordTextField: View {
    @Binding var password: String
    var body: some View {
        TextField("Password", text: $password)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct SignInButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Spacer()
            Text("Sign In")
                .foregroundStyle(Color(.white))
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(.black)
        .clipShape(.rect(cornerRadius: 8))
        .padding()
    }
}

struct SignUpSection: View {
    var body: some View {
        HStack {
            Text("Don't have an account?")
                .font(.footnote)
                .foregroundStyle(Color(.gray))
            Text("Sign Up")
                .foregroundStyle(Color(.black))
        }
    }
}

