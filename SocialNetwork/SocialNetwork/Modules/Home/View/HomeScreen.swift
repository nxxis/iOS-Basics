//
//  ProfileScreen.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    // MARK: - Properties
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        
        NavigationView {
            //            if viewModel.postArr.isEmpty {
            //                Text("No Posts")
            //            } else {
            List {
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.horizontal, 140)
                } else {
                    ForEach(viewModel.postArr, id: \.self) { post in
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image("ios")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .padding(.bottom, 5)
                                Text(post.postedBy.username)
                                    .font(.subheadline)
                                    .padding(.bottom, 5)
                            }
                            .padding(.bottom, -5)
                            VStack(alignment: .leading) {
                                //                                let image = viewModel.convertBase64StringToImage(imageBase64String: post.image!)
                                //                                Image(uiImage: image)
                                Image("ios")
                                    .resizable()
                                    .frame(width: 310, height: 200)
                                    .scaledToFill()
                                HStack {
                                    Text(post.postedBy.username)
                                        .font(.headline)
                                    Text(post.postTitle.capitalized)
                                        .padding(.bottom, -2)
                                }.padding(.bottom, 2)
                                Text(post.postDescription)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            viewModel.deletePost(index: index)
                        }
                    })
                    .padding(.bottom, 5)
                }
            }
            .navigationTitle("Posts")
            //            }
        }
        .toolbar {
            NavigationLink {
                PostScreen(viewModel: PostViewModel())
            } label: {
                Image(systemName: "plus")
            }
            .onAppear() {
                viewModel.getPosts()
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel())
    }
}
