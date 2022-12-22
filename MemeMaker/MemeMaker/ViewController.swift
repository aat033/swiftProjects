//
//  ViewController.swift
//  MemeMaker
//
//  Created by Aiden on 12/5/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var topSegment: UISegmentedControl!
    @IBOutlet weak var bottomSegment: UISegmentedControl!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var topChoices = [CaptionChoice]()
    var bottomChoices = [CaptionChoice]()
    
    @IBOutlet var background: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coolChoice = CaptionChoice(emoji: "🕶", caption: "You know what's cool?")
        let madChoice = CaptionChoice(emoji: "💥", caption: "You know what makes me mad?")
        let loveChoice = CaptionChoice(emoji: "💕", caption: "You know what i love?")
        topChoices = [coolChoice, madChoice, loveChoice]
        topSegment.removeAllSegments()
        for choice in topChoices {
            topSegment.insertSegment(withTitle: choice.emoji, at: topChoices.count , animated: false)
        }
        topSegment.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        let catChoice = CaptionChoice(emoji: "🐱", caption: "Cats wearing hats")
        let dogChoice = CaptionChoice(emoji: "🐕", caption: "Dogs carrying logs")
        let monkeyChoice = CaptionChoice(emoji: "🐵", caption: "Monkeys being funky")
        bottomChoices = [catChoice, dogChoice, monkeyChoice]
        bottomSegment.removeAllSegments()
        for choice in bottomChoices {
            bottomSegment.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegment.selectedSegmentIndex = 0
        updateLabels()
        background.backgroundColor = .gray
    }
    
    func updateLabels() {
        let topIndex = topSegment.selectedSegmentIndex
        let bottomIndex = bottomSegment.selectedSegmentIndex
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        topLabel.text = topChoice.caption
        bottomLabel.text = bottomChoice.caption
        
    }

    @IBAction func choiceSelected(_ sender: Any) {
        updateLabels()
    }
    
}

