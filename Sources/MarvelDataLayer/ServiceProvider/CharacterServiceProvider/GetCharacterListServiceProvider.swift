//
//  GetCharacterListServiceProvider.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import NetworkLayer
import MarvelDomainLayer

public final class GetCharacterListServiceProvider: ApiServiceProvider {
    public init(httpPropertyProvider: HttpPropertyProviderProtocol, with request: CharacterListRequest) {
        super.init(httpPropertyProvider: httpPropertyProvider, path: URLBase.Path.characterList.description, data: request)
    }
}
