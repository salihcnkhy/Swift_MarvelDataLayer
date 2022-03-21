//
//  ImageRepository.swift
//  
//
//  Created by Salihcan Kahya on 21.03.2022.
//

import Combine
import DataLayerBase
import UIKit
import MarvelDomainLayer

public final class ImageRepository: BaseRepository<ImageApiRemoteProtocol>, ImageRepositoryProtocol {
    
    private let imageCacheProvider: ImageCacheProviderProtocol
    
    public init(imageCacheProvider: ImageCacheProviderProtocol, apiRemote: ImageApiRemoteProtocol) {
        self.imageCacheProvider = imageCacheProvider
        super.init(apiRemote: apiRemote)
    }
    
    public func getImage(with request: NetworkImageRequest) -> AnyPublisher<UIImage?, Error> {
        imageCacheProvider
            .getImage(request.path)
            .flatMap { image -> AnyPublisher<UIImage?, Error> in
                if image == nil {
                    print("Requested from Network \(request.path)")
                    return self.apiRemote.getImageData(with: request)
                        .compactMap {
                            let image = UIImage(data: $0)
                            if let image = image {
                                self.imageCacheProvider.setImage(image, key: request.path)
                            }
                            return image
                        }
                        .eraseToAnyPublisher()
                } else {
                    print("Loaded from cache \(request.path)")
                    return Future<UIImage?, Error>( { $0(.success(image)) }).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
