//
//  NetworkManager.swift
//  UrlTableView
//
//  Created by ebpearls on 16/06/2023.
//

import Foundation

struct HttpUtility {
    
    // MARK: - getApiData
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping (_ result: T) -> Void) {
        
        URLSession.shared.dataTask(with: requestUrl) { responseData, httpUrlResponse, error in
            if error == nil,
               let responseData = responseData,
               !responseData.isEmpty {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData)
                    completionHandler(result)
                } catch {
                    print("Error occurred while decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    // MARK: - postApiData
    func postApiData<T: Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping (_ result: T) -> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "Post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, httpUrlResponse, error in
            if error == nil, let responseData = data, !responseData.isEmpty {
                do {
                    let response = try JSONDecoder().decode(T.self, from: responseData)
                    print(httpUrlResponse as Any)
                    completionHandler(response)
                } catch let decodingError{
                    print(decodingError)
                }
            }
        }.resume()
    }
}
