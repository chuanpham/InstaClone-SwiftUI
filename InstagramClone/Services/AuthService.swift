//
//  AuthService.swift
//  InstagramClone
//
//  Created by chuanpham on 10/04/2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import FirebaseCore

class AuthService {
    static func signupUser(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            
            
            let storageAvatarUserId = Ref.STORAGE_AVATAR_USERID(userId: userId)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            StorageService.saveAvatar(userId: userId, username: username, email: email, imageData: imageData, metadata: metadata, storageAvatarRef: storageAvatarUserId, onSuccess: onSuccess, onError: onError)
            
        }
    }
    
    static func signInUser(email: String, password: String, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authData, error in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            let firestoreUserId = Ref.FIRESTORE_DOCUMENT_USERID(userId: userId)
            firestoreUserId.getDocument { document, error in
                if let dict = document?.data() {
                    guard let decoderUser = try? User.init(fromDictionary: dict) else { return }
                    onSuccess(decoderUser)
                }
            }
        }
    }
}
