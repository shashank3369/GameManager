//
//  IGDBGenre.swift
//  GameManager
//
//  Created by Kothapalli on 12/6/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation

struct IGDBGenre{
    
    // MARK: Properties
    
    let name: String
    
    // MARK: Initializers
    init (dictionary: [String:AnyObject]) {
        name = dictionary[IGDBClient.JSONResponseKeys.GenreName] as! String
    }
    
    static func genreFromResults(_ results: [[String:AnyObject]]) -> [IGDBGenre] {
        
        var genres = [IGDBGenre]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            genres.append(IGDBGenre(dictionary: result))
        }
        
        return genres
    }
    
}
