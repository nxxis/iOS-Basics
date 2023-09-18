//
//  ProfileViewModel.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import Foundation
import SocialNetworkAPI
import SwiftUI

typealias Post = GetPostsQuery.Data.GetPost

class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var postArr: [Post] = []
    @Published var isLoading: Bool = false
    
    // MARK: - getPosts
    func getPosts() {
        isLoading = true
        let posts = GetPostsQuery()
        NetworkLayer.shared.fetchData(query: posts) { result in
            switch result {
            case .success(let data):
                self.postArr = data.getPosts
                self.isLoading = false
            case .failure(_):
                return
            }
        }
    }
    
    func deletePost(index: Int) {
        let removePost = RemovePostMutation(removePostId: postArr[index]._id)
        NetworkLayer.shared.apollo.perform(mutation: removePost) {
            data in
            switch data {
            case .success(let data):
                if data.data != nil {
                    self.postArr.remove(at: index)
                } else {
                    print(data.errors?.description ?? "")
                }
            case .failure(_):
                return
            }
        }
    }
    
    //    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    //        let imageData = Data(base64Encoded: imageBase64String)
    //        let image = UIImage(data: imageData!)
    //        return image!
    //    }
}
