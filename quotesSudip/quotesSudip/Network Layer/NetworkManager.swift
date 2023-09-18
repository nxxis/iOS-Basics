//
//  NetworkManager.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
//

import Foundation

struct HttpUtility {
    
    // MARK: - getApiData
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping (_ result: Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { responseData, httpUrlResponse, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let httpResponse = httpUrlResponse as? HTTPURLResponse else {
                let unknownError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])
                completionHandler(.failure(unknownError))
                return
            }
            
            let statusCode = httpResponse.statusCode
            if !(200...299).contains(statusCode) {
                let apiError: APIError?
                if let data = responseData {
                    let decoder = JSONDecoder()
                    do {
                        apiError = try decoder.decode(APIError.self, from: data)
                    } catch {
                        apiError = nil
                    }
                } else {
                    apiError = nil
                }
                
                let errorMessage = apiError?.message ?? HTTPURLResponse.localizedString(forStatusCode: statusCode)
                let responseError = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                completionHandler(.failure(responseError))
                return
            }
            
            if let responseData = responseData {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
