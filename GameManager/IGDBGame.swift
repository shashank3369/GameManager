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
    let rating: Double?
    
    // MARK: Initializers
    init (dictionary: [String:AnyObject]) {
        title = dictionary[IGDBClient.JSONResponseKeys.GameName] as! String
        rating = dictionary[IGDBClient.JSONResponseKeys.GameRating] as? Double
    }
    
    static func gamesFromResults(_ results: [[String:AnyObject]]) -> [IGDBGame] {
        
        var games = [IGDBGame]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            games.append(IGDBGame(dictionary: result))
        }
        
        return games
    }
    
}
