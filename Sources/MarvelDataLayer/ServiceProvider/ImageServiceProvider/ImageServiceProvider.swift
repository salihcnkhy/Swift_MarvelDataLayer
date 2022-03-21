//
//  ImageServiceProvider.swift
//  
//
//  Created by Salihcan Kahya on 21.03.2022.
//

import NetworkLayer
import MarvelDomainLayer

public final class ImageServiceProvider: ApiServiceProvider {
    public init(httpPropertyProvider: HttpPropertyProviderProtocol, with request: NetworkImageRequest) {
        super.init(httpPropertyProvider: httpPropertyProvider, method: .get, path: request.path)
    }
}
