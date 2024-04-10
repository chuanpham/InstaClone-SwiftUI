//
//  SwiftUPView.swift
//  InstagramClone
//
//  Created by chuanpham on 09/04/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var showImagePicker: Bool = false
    @State var image: Image = Image(systemName: "person.circle")
    @State var imageData: Data = Data()
    
    func signUp() {
        //Firebase.createAccount(username: username, email: email, password: password, imageData: imageData)
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                return
            }
            guard let userId = authData?.user.uid else { return }
            let storageRoot = Storage.storage().reference(forURL: "gs://instaclone-319dc.appspot.com")
            let storageAvatar = storageRoot.child("avatar")
            let storageAvatarUserId = storageAvatar.child(userId)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            storageAvatarUserId.putData(imageData, metadata: metadata) { ( storageMetadata, error) in
                if error != nil {
                    return
                }
                
                storageAvatarUserId.downloadURL { url, error in
                    if let metaImageUrl = url?.absoluteString {
                        if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                            changeRequest.photoURL = url
                            changeRequest.displayName = self.username
                            changeRequest.commitChanges { error in
                                if error != nil {
                                    return
                                }
                            }
                        }
                        
                        let firestoreRoot = Firestore.firestore()
                        let firestoreUsers = firestoreRoot.collection("users")
                        let firestoreUserId = firestoreUsers.document(userId)
                        let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, bio: "", keywords:   [])
                        guard let dict = try? user.toDictionary() else { return }
                        firestoreUserId.setData(dict)
                    }
                }
            }
        }
    }
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 85, height: 85)
                .clipShape(Circle())
                .padding(.bottom, 85)
                .onTapGesture {
                    self.showImagePicker.toggle()
                }
            
            UsernameTextField(username: $username)
            
            EmailTextField(email: $email)
            
            VStack(alignment: .leading) {
                PasswordTextField(password: $password)
                Text("At least 8 chracters required!")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
                    .padding(.leading)
            }
            
            VStack(alignment: .leading) {
                SignUpButton(action: signUp)
                Text("*An account will allow you to save and access photo information across devices. You can  delete your account at any time and your information will not be shared.")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
                    .padding([.leading, .top])
            }
        }
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(showImagePicker: $showImagePicker, pickedImage: self.$image, imageData: self.$imageData)
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
