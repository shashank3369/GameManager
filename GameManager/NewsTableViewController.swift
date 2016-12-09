//
//  NewsTableViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/8/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var newsArticles = [IGDBNews]()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = IGDBClient.sharedInstance().getNews { (articles, error) in
            if let articles = articles {
                self.newsArticles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.categoryLabel.text = "\(newsArticles[indexPath.row].category)"
        cell.titleLabel.text = newsArticles[indexPath.row].title
        
        if let image = newsArticles[indexPath.row].image {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            cell.newsImage.image = UIImage(data: data!)
        }
        
        // Configure the cell...

        return cell
    }

}
