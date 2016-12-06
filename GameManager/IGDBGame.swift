//
//  IGDBGame.swift
//  GameManager
//
//  Created by Kothapalli on 12/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation

// MARK: - TMDBMovie

struct IGDBGame {
    
    // MARK: Properties
    
    let title: String
    
    // MARK: Initializers
    init (dictionary: [String:AnyObject]) {
        title = dictionary[IGDBClient.JSONResponseKeys.GameName] as! String
    }
    
    static func gamesFromResults(_ results: [[String:AnyObject]]) -> [IGDBGame] {
        
        var movies = [IGDBGame]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            movies.append(IGDBGame(dictionary: result))
        }
        
        return movies
    }
    
}
