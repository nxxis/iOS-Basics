//
//  FormViewModel.swift
//  UrlTableView
//
//  Created by ebpearls on 27/06/2023.
//

import Foundation

class FormViewModel {
    
    // MARK: - Properties
    private let httpUtility: HttpUtility
    
    // MARK: - initilization
    init(httpUtility: HttpUtility) {
        self.httpUtility = httpUtility
    }
    
    // MARK: - postApi
    func postApi(product: ProductsPost) {
        if let url = URL(string: "https://dummyjson.com/products/add") {
            do {
                let encodedRequest = try JSONEncoder().encode(product)
                self.httpUtility.postApiData(requestUrl: url, requestBody: encodedRequest, resultType: ProductsPost.self) { result in
                    print("API posted")
                }
            } catch let error {
                print("error\(error.localizedDescription)")
            }
        }
    }
}
