//
//  PostViewModel.swift
//  SocialNetwork
//
//  Created by ebpearls on 04/08/2023.
//

import SwiftUI
import Apollo
import SocialNetworkAPI
import PhotosUI

class PostViewModel: ObservableObject {
    
    @Published var postTitle: String = ""
    @Published var postDescription: String = ""
    @Published var isPublic: Bool = false
    
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    
    @Published var showAlert: Bool = false
    
    @State var selectedItem: PhotosPickerItem? = nil {
        didSet {
//            convertSelectedImage(selection: selectedItem)
        }
    }
//    @State var selectedImage: UIImage? = nil
    
    func createPost() {
        let input = CreatePostInput(postTitle: postTitle, postDescription: postDescription, isPublic: isPublic)
//        guard let selectedImage = selectedImage else { return }
//        let file = convertImageToBase64String(img: selectedImage)
        let createPost = CreatePostMutation(createPost: input)
        NetworkLayer.shared.apollo.perform(mutation: createPost) {
            result in
            switch result {
            case .success(_):
                self.alertTitle = "Success"
                self.alertMessage = "Posted"
                self.showAlert.toggle()
            case .failure(_):
                self.alertTitle = "Error"
                self.showAlert.toggle()
            }
        }
    }
    
//    func convertImageToBase64String (img: UIImage) -> String {
//        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
//    }
//
//    func convertSelectedImage(selection: PhotosPickerItem?) {
//        guard let selection else { return }
        
//        Task {
//            if let data = try? await selection.loadTransferable(type: Data.self) {
//                if let uiImage = UIImage(data: data) {
//                    selectedImage = uiImage
//                }
//            }
//        }
//    }
}
