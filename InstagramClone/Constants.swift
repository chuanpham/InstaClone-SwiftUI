//
//  Constants.swift
//  InstagramClone
//
//  Created by chuanpham on 10/04/2024.
//

import SwiftUI
import Firebase
import FirebaseStorage

class Ref {
    // Storage
    static var STORAGE_ROOT = Storage.storage().reference(forURL: "gs://instaclone-319dc.appspot.com")
    static var STORAGE_AVATAR = STORAGE_ROOT.child("avatar")
    static func STORAGE_AVATAR_USERID(userId: String) -> StorageReference {
        return STORAGE_AVATAR.child(userId)
    }
    
    // Firestore
    static var FIRESTORE_ROOT = Firestore.firestore()
    static var FIRESTORE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
    static func FIRESTORE_DOCUMENT_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_USERS.document(userId)
    }
}
