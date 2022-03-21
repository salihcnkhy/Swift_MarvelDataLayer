//
//  ImageCacheProvider.swift
//  
//
//  Created by Salihcan Kahya on 21.03.2022.
//

import Combine
import Foundation
import MarvelDomainLayer
import UIKit

public final class ImageCacheProvider: ImageCacheProviderProtocol {

    private let cache = NSCache<NSString, UIImage>()
    
    public init() { }
    
    public func getImage(_ key: String) -> AnyPublisher<UIImage?, Never> {
        let image = cache.object(forKey: key as NSString)
        return Just<UIImage?>(image).eraseToAnyPublisher()
    }
    
    public func setImage(_ image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
