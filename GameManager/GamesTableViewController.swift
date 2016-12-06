//
//  GamesTableViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {

    @IBOutlet weak var homeSegmentedControl: UISegmentedControl!
    var games = [IGDBGame]()
    var genres = [IGDBGenre]()
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = IGDBClient.sharedInstance().getPopularGames { (games, error) in
            if let games = games {
                self.games = games
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        _ = IGDBClient.sharedInstance().getGenres(completionHandlerForMovies: { (genres, error) in
            if let genres = genres {
                self.genres = genres
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var numOfRows: Int = 0
        switch homeSegmentedControl.selectedSegmentIndex {
            case 0:
                numOfRows = games.count
            case 1:
                numOfRows = genres.count
            default:
                break
        }
        return numOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellReuseId = "GameTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseId) as! GameTableViewCell
        switch homeSegmentedControl.selectedSegmentIndex {
            case 0:
                let game = games[(indexPath as NSIndexPath).row]
                cell.gameTitle.text = game.title
            case 1:
                let genre = genres[(indexPath as NSIndexPath).row]
                cell.gameTitle.text = genre.name
            default:
                break
        }
        
        return cell
    }
    @IBAction func homeSegmentedControlChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    
}
