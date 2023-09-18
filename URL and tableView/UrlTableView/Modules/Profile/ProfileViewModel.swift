//
//  ProfileViewModel.swift
//  UrlTableView
//
//  Created by ebpearls on 27/06/2023.
//

import Foundation
import Alamofire

class ProfileViewModel {
    // MARK: - properties
    private var id: Int
    private let httpUtility: HttpUtility
    
    var product: ProductsGet?
    
    var productObtained: (()->Void)?
    
    // MARK: - initilization
    init(httpUtility: HttpUtility, id: Int) {
        self.id = id
        self.httpUtility = httpUtility
    }
    
    // MARK: - getDataUsingAloma
    func getDataUsingAloma() {
        AF.request("https://dummyjson.com/products/" + "\(String(describing: id))")
            .validate()
            .responseDecodable(of: ProductsGet.self,queue: DispatchQueue.main,decoder: JSONDecoder()) { [weak self] response in
                
                guard let self = self else { return }
                
                switch response.result {
                case .success(let products):
                    self.product = products
                    
                    self.productObtained?()
                    
                case .failure(let error):
                    print("Error occurred while decoding: \(error.localizedDescription)")
                }
            }
    }
}
