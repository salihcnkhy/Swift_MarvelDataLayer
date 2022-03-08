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
    
    public var description: String {
        switch self {
            case .prod:
                return "https://gateway.marvel.com:443/v1/public/"
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


