//
//  CharacterRepository.swift
//  
//
//  Created by Salihcan Kahya on 22.02.2022.
//

import Combine
import MarvelDomainLayer
import DataLayerBase

final class CharacterRepository: BaseRepository<CharacterApiRemoteProtocol>, CharacterRepositoryProtocol {
    func getCharacterList(with request: CharacterListRequest) -> AnyPublisher<MarvelCharacterListResponse, MarvelServerErrorResponse> {
        apiRemote.getCharacterList(with: request)
    }
}
