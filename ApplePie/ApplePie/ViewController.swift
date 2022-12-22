//
//  ViewController.swift
//  ApplePie
//
//  Created by Aiden on 11/16/22.
//

import UIKit

var listOfWords = ["buccaneer", "swift", "glorious","bug","charger","volkswagen"]

let incorrectMovesAllowed = 7

var totalWins = 0

var totalLosses = 0

class ViewController: UIViewController
{

    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
   }

    var currentGame: Game!
    
   
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining:
        incorrectMovesAllowed)
        updateUI()
    }
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }


    
    @IBAction func letterButtonPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
        
        
    }
    
    
    

} // end of view controller

