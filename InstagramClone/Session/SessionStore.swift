//
//  SessionStore.swift
//  InstagramClone
//
//  Created by chuanpham on 12/04/2024.
//

import Foundation
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    var handle: AuthStateDidChangeListenerHandle?
    @Published var isLoggedIn = false
    @Published var userSession: User?
    
    func listenAuthState() {
        handle = Auth.auth().addStateDidChangeListener({ auth, user in
            if user != nil {
                guard let userId = user?.uid else { return }
                let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
                firestoreUserId.getDocument { document, error in
                    if let dict = document?.data() {
                        guard let decoderUser = try? User.init(fromDictionary: dict) else { return }
                        self.userSession = decoderUser
                    }
                }
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.userSession = nil
            }
        })
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    // stop listening for auth changes
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
