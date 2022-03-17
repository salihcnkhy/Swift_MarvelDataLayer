//
//  CharacterServiceProviderGroup.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import Foundation
import DataLayerBase
import MarvelDomainLayer

public protocol CharacterServiceProviderGroupProtocol {
    func getCharacterListServiceProvider(with request: CharacterListRequest) -> GetCharacterListServiceProvider
}

public final class CharacterServiceProviderGroup: BaseServiceProviderGroup, CharacterServiceProviderGroupProtocol {
    public func getCharacterListServiceProvider(with request: CharacterListRequest) -> GetCharacterListServiceProvider {
        GetCharacterListServiceProvider(httpPropertyProvider: httpProperyProvider, with: request)
    }
}
