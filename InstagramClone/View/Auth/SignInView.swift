//
//  ContentView.swift
//  InstagramClone
//
//  Created by chuanpham on 09/04/2024.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var signInViewModel = SignInViewModel()
    
    func signIn() {
        signInViewModel.signIn(email: signInViewModel.email, password: signInViewModel.password, completed: { user in
            self.clean()
            // Switch to the Main App
            print(user.email)
            
        }) { errorMessage in
            self.signInViewModel.showAlert = true
            self.signInViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean() {
        self.signInViewModel.email = ""
        self.signInViewModel.password = ""
    }
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
            
            EmailTextField(email: $signInViewModel.email)
            
            PasswordTextField(password: $signInViewModel.password)
            
            SignInButton(action: signIn)
                .alert(isPresented: $signInViewModel.showAlert) {
                    Alert(
                        title: Text("Authentication error!"),
                        message: Text(self.signInViewModel.errorString),
                        dismissButton: .default(Text("OK")))
                }
            
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
        SecureField("Password", text: $password)
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

