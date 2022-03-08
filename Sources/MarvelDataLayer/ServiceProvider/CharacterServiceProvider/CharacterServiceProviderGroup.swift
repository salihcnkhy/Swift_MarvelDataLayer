//
//  CharacterServiceProviderGroup.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import Foundation
import DataLayerBase

public protocol CharacterServiceProviderGroupProtocol {
    func getCharacterListServiceProvider() -> GetCharacterListServiceProvider
}

final class CharacterServiceProviderGroup: BaseServiceProviderGroup, CharacterServiceProviderGroupProtocol {
    func getCharacterListServiceProvider() -> GetCharacterListServiceProvider {
        GetCharacterListServiceProvider(httpPropertyProvider: httpProperyProvider)
    }
}
