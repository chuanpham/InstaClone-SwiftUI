//
//  SwiftUPView.swift
//  InstagramClone
//
//  Created by chuanpham on 09/04/2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var signupViewModel = SignupViewModel()
    
    func signUp() {
        signupViewModel.signUp(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            self.clean()
            // Switch to the Main App
        }) { (errorMessage) in
            self.signupViewModel.showAlert = true
            self.signupViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean() {
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    var body: some View {
        VStack {
            signupViewModel.image
                .resizable()
                .frame(width: 85, height: 85)
                .clipShape(Circle())
                .padding(.bottom, 85)
                .onTapGesture {
                    self.signupViewModel.showImagePicker.toggle()
                }
            
            UsernameTextField(username: $signupViewModel.username)
            
            EmailTextField(email: $signupViewModel.email)
            
            VStack(alignment: .leading) {
                PasswordTextField(password: $signupViewModel.password)
                Text("At least 8 chracters required!")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
                    .padding(.leading)
            }
            
            VStack(alignment: .leading) {
                SignUpButton(action: signUp)
                    .alert(isPresented: $signupViewModel.showAlert) {
                        Alert(
                            title: Text("Authentication error!"),
                            message: Text(self.signupViewModel.errorString),
                            dismissButton: .default(Text("OK")))
                    }
                Text("*An account will allow you to save and access photo information across devices. You can  delete your account at any time and your information will not be shared.")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
                    .padding([.leading, .top])
            }
        }
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $signupViewModel.showImagePicker) {
            ImagePicker(showImagePicker: $signupViewModel.showImagePicker, pickedImage: self.$signupViewModel.image , imageData: self.$signupViewModel.imageData)
        }
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct SignUpButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Spacer()
            Text("Sign Up")
                .foregroundStyle(Color(.white))
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(.black)
        .clipShape(.rect(cornerRadius: 8))
        .padding([.horizontal, .top])
    }
}
