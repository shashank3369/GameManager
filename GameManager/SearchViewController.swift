//
//  SearchViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/7/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var games = [IGDBGame]()
    @IBOutlet weak var gameSearchBar: UISearchBar!
    @IBOutlet weak var gameTableView: UITableView!
    
    var searchTask: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameSearchBar.becomeFirstResponder()
        
        // configure tap recognizer
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.delegate = self
        view.addGestureRecognizer(tapRecognizer)
    }

    func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
        gameSearchBar.resignFirstResponder()
    }
}

// MARK: - MoviePickerViewController: UIGestureRecognizerDelegate

extension SearchViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return gameSearchBar.isFirstResponder
    }
}


extension SearchViewController: UISearchBarDelegate {
    
    // each time the search text changes we want to cancel any current download and start a new one
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // cancel the last task
        if let task = searchTask {
            task.cancel()
        }
        
        // if the text is empty we are done
        if searchText == "" {
            games = [IGDBGame]()
            gameTableView?.reloadData()
            return
        }
        
        // new search
        searchTask = IGDBClient.sharedInstance().getGamesForSearchString(searchText) { (games, error) in
            self.searchTask = nil
            if let games = games {
                self.games = games
                DispatchQueue.main.async {
                    self.gameTableView!.reloadData()
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


// MARK: - MoviePickerViewController: UITableViewDelegate, UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellReuseId = "GameSearchCell"
        let game = games[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseId) as UITableViewCell!
        
        cell?.textLabel?.text = game.title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
}
