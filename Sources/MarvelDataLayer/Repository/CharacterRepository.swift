//
//  CharacterRepository.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import Combine
import MarvelDomainLayer
import DataLayerBase

public final class CharacterRepository: BaseRepository<CharacterApiRemoteProtocol>, CharacterRepositoryProtocol {
    public func getCharacterList(with request: CharacterListRequest) -> AnyPublisher<MarvelCharacterListResponse, MarvelServerErrorResponse> {
        apiRemote.getCharacterList(with: request)
    }
}
