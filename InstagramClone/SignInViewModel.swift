//
//  SignInViewModel.swift
//  InstagramClone
//
//  Created by chuanpham on 12/04/2024.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI


class SignInViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    var errorString = ""
    @Published var showAlert: Bool = false
    
    func signIn(email: String, password: String, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
           AuthService.signInUser(email: email, password: password, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields"
        }
    }
}
