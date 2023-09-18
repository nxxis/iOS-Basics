//
//  PostView.swift
//  SocialNetwork
//
//  Created by ebpearls on 04/08/2023.
//

import SwiftUI
import PhotosUI

struct PostScreen: View {
    
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("PostTitle", text: $viewModel.postTitle)
                    .defaultForm()
                    .padding(.top, 30)
                
                TextField("Description", text: $viewModel.postDescription)
                    .defaultForm()
                
                HStack {
                    PhotosPicker(selection: $viewModel.selectedItem,
                                 matching: .images) {
                        Text("Add Photo")
                            .padding(.leading, 30)
                    }
                   
                    Toggle("Public", isOn: $viewModel.isPublic)
                        .font(.bold(.headline)())
                        .padding(.leading, 135)
                        .padding(.trailing, 30)
                }
                
                Button("Post") {
                    viewModel.createPost()
                }
                .defaultButton()
                .disabled(viewModel.postTitle.isEmpty && viewModel.postDescription.isEmpty)
                
                Spacer()
            }
            .navigationTitle("Add Post")
            .alert(isPresented: $viewModel.showAlert, content: {
                getAlert()
            })
        }
    }
    
    // MARK: - getAlert
    func getAlert() -> Alert {
        return      Alert(
            title: Text(viewModel.alertTitle),
            message: Text(viewModel.alertMessage),
            dismissButton: .cancel(Text("OK"), action: {
                viewModel.postTitle = ""
                viewModel.postDescription = ""
            }))
    }
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen(viewModel: PostViewModel())
    }
}
