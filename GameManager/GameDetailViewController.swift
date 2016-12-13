//
//  MovieDetailViewController.swift
//  GameManager
//
//  Created by Kothapalli on 12/12/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameRating: UILabel!
    var game: IGDBGame?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let chosenGame = game {
            gameTitle.text = chosenGame.title
            if let rating = chosenGame.rating {
                gameRating.text = "\(rating)"
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
