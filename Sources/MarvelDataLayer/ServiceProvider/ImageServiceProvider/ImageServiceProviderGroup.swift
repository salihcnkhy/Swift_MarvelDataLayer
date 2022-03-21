//
//  ImageServiceProviderGroup.swift
//  
//
//  Created by Salihcan Kahya on 21.03.2022.
//

import Foundation
import DataLayerBase
import MarvelDomainLayer

public protocol ImageServiceProviderGroupProtocol {
    func getImageDataServiceProvider(with request: NetworkImageRequest) -> ImageServiceProvider
}

public final class ImageServiceProviderGroup: BaseServiceProviderGroup, ImageServiceProviderGroupProtocol {
    public func getImageDataServiceProvider(with request: NetworkImageRequest) -> ImageServiceProvider {
        ImageServiceProvider(httpPropertyProvider: httpProperyProvider, with: request)
    }
}
