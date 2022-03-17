//
//  File.swift
//  
//
//  Created by 112471 on 22.02.2022.
//

import Foundation
import DataLayerBase
import MarvelDomainLayer
import Combine

public final class CharacterApiRemote: BaseApiRemote<CharacterServiceProviderGroupProtocol>, CharacterApiRemoteProtocol {
    public func getCharacterList(with request: CharacterListRequest) -> AnyPublisher<MarvelCharacterListResponse, MarvelServerErrorResponse> {
        networkManager.execute(with: serviceProviderGroup.getCharacterListServiceProvider(with: request))
    }
}
