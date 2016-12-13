//
//  NewsTableViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/8/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit
import SDWebImage

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
        // Configure the cell...
        cell.categoryLabel.text = "\(newsArticles[indexPath.row].category)"
        cell.titleLabel.text = newsArticles[indexPath.row].title
        
        if let image = newsArticles[indexPath.row].image {
            cell.newsImage.image = nil
            downloadImageWithURL(image, completionHandlerForImage: { (success, image) in
                if success {
                    DispatchQueue.main.async {
                        cell.newsImage.image = image
                    }
                }
            })
        }

        return cell
    }

}

extension NewsTableViewController {
    func downloadImageWithURL(_ url: String, completionHandlerForImage: @escaping (_ success: Bool, _ image: UIImage?) -> Void) {
        // create url
        let imageURL = URL(string: url)!
        
        // create network request
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            if error == nil {
                
                // create image
                var downloadedImage = UIImage(data: data!)
                
                downloadedImage = downloadedImage?.resizeImage(newWidth: 100)
                completionHandlerForImage(true, downloadedImage)
                
            } else {
                completionHandlerForImage(false, nil)
            }
        }
        
        // start network request
        task.resume()

    }
}


extension UIImage {
    
    func resizeImage(newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
