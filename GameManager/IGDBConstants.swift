//
//  IGDBConstants.swift
//  GameManager
//
//  Created by Kothapalli on 12/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation

extension IGDBClient {
    
    // MARK: Constants
    struct Constants {
        // MARK: API Key
        static let ApiKey = "6ZrY0Zzd9cmshElg8fzEgqJFFuGZp1fw1k4jsnkF3roQLBNEJX"
        static let Format = "application/json"
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "igdbcom-internet-game-database-v1.p.mashape.com"
        
    }
    
    // MARK: Methods
    struct Methods {
        static let Games = "/games/"
        static let Genres = "/genres/"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        static let ApiKey = "X-Mashape-Key"
        static let Format = "Accept"
        static let Fields = "fields"
        static let Limit = "limit"
        static let Order = "order"
        static let Search = "search"
    }
    
    struct JSONResponseKeys {
        static let GameName = "name"
        static let GenreName = "name"
    }
}
