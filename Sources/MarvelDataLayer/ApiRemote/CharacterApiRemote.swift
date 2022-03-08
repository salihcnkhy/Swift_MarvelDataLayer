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

final class CharacterApiRemote: BaseApiRemote<CharacterServiceProviderGroupProtocol> {
    func getCharacterList() -> AnyPublisher<(CharacterListResponse?, ServerErrorSample?), Error> {
        networkManager.execute(with: serviceProviderGroup.getCharacterListServiceProvider())
    }
}

struct ServerErrorSample: Decodable { }
