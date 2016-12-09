//
//  IGDBNews.swift
//  GameManager
//
//  Created by Kothapalli on 12/8/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation

struct IGDBNews{
    
    // MARK: Properties
    
    let category: Int
    let title: String
    let image: String?
    let url: String
    
    // MARK: Initializers
    init (dictionary: [String:AnyObject]) {
        category = dictionary[IGDBClient.JSONResponseKeys.NewsCategory] as! Int
        title = dictionary[IGDBClient.JSONResponseKeys.NewsTitle] as! String
        image = dictionary[IGDBClient.JSONResponseKeys.NewsImage] as? String
        url = dictionary[IGDBClient.JSONResponseKeys.NewsUrl] as! String
        
    }
    
    static func articleFromResults(_ results: [[String:AnyObject]]) -> [IGDBNews] {
        
        var genres = [IGDBNews]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            genres.append(IGDBNews(dictionary: result))
        }
        
        return genres
    }
    
}
