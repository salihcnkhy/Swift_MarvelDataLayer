//
//  ImageApiRemote.swift
//  
//
//  Created by Salihcan Kahya on 21.03.2022.
//

import Combine
import DataLayerBase
import MarvelDomainLayer
import Foundation

public final class ImageApiRemote: BaseApiRemote<ImageServiceProviderGroupProtocol>, ImageApiRemoteProtocol {
    public func getImageData(with request: NetworkImageRequest) -> AnyPublisher<Data, Error> {
        networkManager.execute(with: serviceProviderGroup.getImageDataServiceProvider(with: request))
    }
}
