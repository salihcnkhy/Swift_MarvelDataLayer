//
//  GetCharacterListServiceProvider.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import NetworkLayer

public final class GetCharacterListServiceProvider: ApiServiceProvider {
    public init(httpPropertyProvider: HttpPropertyProviderProtocol) {
        super.init(httpPropertyProvider: httpPropertyProvider, path: URLBase.Path.characterList.description)
    }
}
