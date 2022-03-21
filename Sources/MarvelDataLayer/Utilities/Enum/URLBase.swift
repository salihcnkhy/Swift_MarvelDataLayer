//
//  File.swift
//  
//
//  Created by 112471 on 8.03.2022.
//

import Foundation

public protocol StringDescription {
    var description: String { get }
}

public protocol URLPathProviderProtocol {
    var path: String { get }
}

public enum URLBase: StringDescription {
    
    case prod
    case prodImage//(character: String, code: String, id: String, )
    
    public var description: String {
        switch self {
            case .prod:
                return "https://gateway.marvel.com:443/v1/public/"
            case .prodImage:
                return "http://i.annihil.us/u/prod/marvel/i/mg/"
        }
    }
    
    public enum Path: StringDescription {
        
        case characterList
        
        public var description: String {
            switch self {
                case .characterList:
                    return "characters"
            }
        }
    }
}


