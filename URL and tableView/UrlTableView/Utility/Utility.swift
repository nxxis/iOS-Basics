//
//  ImageCaching.swift
//  UrlTableView
//
//  Created by ebpearls on 28/06/2023.
//

import Foundation
import Kingfisher

struct Utility {
    
    // MARK: - imageCaching
    static func imageCaching(image: String, completionHandler: @escaping ((KFCrossPlatformImage?) -> Void)) {
        let cache = ImageCache.default
        
        if cache.isCached(forKey: image) {
            cache.retrieveImage(forKey: image) { result in
                switch result {
                case .success(let value):
                    print("cached image")
                    completionHandler(value.image)
                case .failure(_):
                    completionHandler(nil)
                }
            }
        } else {
            completionHandler(nil)
        }
    }
}
