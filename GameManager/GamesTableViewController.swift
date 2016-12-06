//
//  GamesTableViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {

    var games = [IGDBGame]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let task = IGDBClient.sharedInstance().getGames { (games, error) in
            
            if let games = games {
                self.games = games
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

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellReuseId = "GameTableCell"
        let game = games[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseId) as! GameTableViewCell
        
        cell.gameTitle.text = game.title
        
        return cell
    }
    
    
}
