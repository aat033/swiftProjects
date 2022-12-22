//
//  ViewController.swift
//  RPS
//
//  Created by Aiden on 12/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
        
    @IBOutlet var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetBoard()
    }
    func resetBoard() {
        computerLabel.text = "🤖"
        statusLabel.text = "Rock, Paper, Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    func play(_ playerTurn:Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
    
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        switch gameResult {
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
        case .win:
            statusLabel.text = "You WIN!"
            background.backgroundColor = .green
        case .lose:
            statusLabel.text = "You lose!"
            background.backgroundColor = .red
        case .draw:
            statusLabel.text = "It's a draw."
            background.backgroundColor = .gray
        }
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
        
        
        
        
        
    }
    
    @IBAction func playAgainSelected(_ sender: Any) {
        resetBoard()
        background.backgroundColor = .white
    }
    
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
        play(Sign.scissors)
    }
    
}

