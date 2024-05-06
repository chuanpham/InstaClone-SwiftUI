//
//  SignUpViewModel.swift
//  InstagramClone
//
//  Created by chuanpham on 10/04/2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SignupViewModel: ObservableObject {
     var username: String = ""
     var email: String = ""
     var password: String = ""
     var image: Image = Image(systemName: "person.circle")
     var imageData: Data = Data()
     var errorString = ""
     @Published var showImagePicker: Bool = false
     @Published var showAlert: Bool = false

    func signUp(username: String, email: String, password: String, imageData: Data, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty && !imageData.isEmpty {
           AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            if imageData.isEmpty {
                errorString = "Please choose an avatar!"
            } else {
                errorString = "Please fill in all fields"
            }
        }
    }
}

