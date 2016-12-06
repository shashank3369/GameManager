//
//  IGDBConvenience.swift
//  GameManager
//
//  Created by Kothapalli on 12/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit
import Foundation

extension IGDBClient {
    
    
    func getGames(completionHandlerForMovies: @escaping (_ result: [IGDBGame]?, _ error: NSError?) -> Void) -> URLSessionDataTask? {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        var parameters: [String: AnyObject] = [IGDBClient.ParameterKeys.Fields: "name" as AnyObject]
        parameters[IGDBClient.ParameterKeys.Limit] = 10 as AnyObject?
        /* 2. Make the request */
        let task = taskForGETMethod(Methods.Games, parameters: parameters as [String:AnyObject]) { (results, error) in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForMovies(nil, error)
            } else {
                if let results = results as? [[String:AnyObject]] {
                    let movies = IGDBGame.gamesFromResults(results)
                    completionHandlerForMovies(movies, nil)
                } else {
                    completionHandlerForMovies(nil, NSError(domain: "getMoviesForSearchString parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getMoviesForSearchString"]))
                }
            }
        }
        
        return task
    }
}
