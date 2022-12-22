//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Aiden on 12/8/22.
//

import UIKit

enum State {
    case question
    case answer
    case score
}
enum Mode {
    case flashCard
    case quiz
}






class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var showAnswer: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    var mode: Mode = .flashCard {
        didSet {
            switch mode {
            case .flashCard:
                setUpFlashCards()
            case .quiz:
                setUpQuiz()
            }
            updateUI()
        }
    }
    
    var state: State = .question
    
    
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        state = .answer
        updateUI()
    }
    
    
    
    
    
    let fixedCarList = ["Audi","Jaguar","Honda","Volkswagen","Hyundai","Volvo","Fiat","Ford","Porsche","Ram","Mazda","Lexus","Chevrolet","Ferrari","Corvette","Tesla","Acura","BMW","Maserati","Mercedes","Mustang","Nissan","Scion","Subaru","Toyota","Bentley","Declan","Dababy"]
    var carList: [String] = []
    //let carList = ["Audi","BMW","Honda","Volkswagen","Hyundai","Volvo"]
    
    var currentCarIndex = 0
    
    // Runs when user hits return key
    func textFieldShouldReturn(_ textField:
       UITextField) -> Bool {
        // get text from text field
        let textFieldContents = textField.text
        
        //Determine if user answered correctly
        //state
        if textFieldContents?.lowercased() == carList[currentCarIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }
        
        state = .answer
        
        updateUI()
        
        return true
    }
    
    
    
    // Updates the apps UI in FlashCard mode
    func updateFlashCardUI(carName: String) {
        textField.isHidden = true
        textField.resignFirstResponder()
        showAnswer.isHidden = false
        showAnswer.isEnabled = true
        nextButton.isEnabled = true
        nextButton.setTitle("Next Logo", for: .normal)
        if state == .answer {
            answerLabel.text = carName
        } else {
            answerLabel.text = "?"
        }
        modeSelector.selectedSegmentIndex = 0
    }
    
    func setUpFlashCards()  {
        state = .question
        currentCarIndex = 0
        carList = fixedCarList
   
    }
    
    func setUpQuiz() {
        state = .question
        currentCarIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
        carList = fixedCarList.shuffled()

        
    }
    
    
    
    
    
    
    // Updates the apps UI in Quiz mode
    func updateQuizUI(carName: String) {
        // Text field and keyboard
        showAnswer.isHidden = true
        showAnswer.isEnabled = false
        textField.isHidden = false
        if currentCarIndex == carList.count - 1 {
            nextButton.setTitle("Show Score",
               for: .normal)
        } else {
            nextButton.setTitle("Next Question",
               for: .normal)
        }
        switch state {
        case .question:
            nextButton.isEnabled = false
        case .answer:
            nextButton.isEnabled = true
        case .score:
            nextButton.isEnabled = false
        }

        switch state {
        case .question:
            textField.isEnabled = true
            textField.text = ""
            textField.resignFirstResponder()
        case .answer:
            textField.isEnabled = false
            textField.resignFirstResponder()
        case .score:
            textField.isHidden = true
            textField.resignFirstResponder()
        }
        // Answer Label
        switch state {
        case .question: answerLabel.text = " "
        case .answer:
            if answerIsCorrect {
                answerLabel.text = "Correct!"
            } else {
                answerLabel.text = "❌\n Correct Answer: " + carName
            }
        case .score:
            answerLabel.text = ""
            print("Your score is \(correctAnswerCount) out of \(carList.count).")
        
        }
        
        if state == .score {
            displayScoreAlert()
        }
        modeSelector.selectedSegmentIndex = 1
        
    }
    
    
    
    //Updates the apps UI mode
    func updateUI() {
        let carName = carList[currentCarIndex]
        let image = UIImage(named: carName)
        imageView.image = image
        switch mode {
        case .flashCard:
            updateFlashCardUI(carName: carName)
        case .quiz:
            updateQuizUI(carName: carName)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .flashCard
        // Do any additional setup after loading the view.
    }


    
    @IBAction func Next(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= carList.count {
            currentCarIndex = 0
            if mode == .quiz {
                state = .score
                updateUI()
                return
            }
        }
        state = .question
        updateUI()
        
    }
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .flashCard
        } else {
            mode = .quiz
        }
        
    }
    
    // Shows an iOS alert with the user's quiz score.
    func displayScoreAlert() {
        let alert = UIAlertController(title:
           "Quiz Score",
           message: "Your score is \(correctAnswerCount) out of \(carList.count).",
              preferredStyle: .alert)
        
        let dismissAction =
           UIAlertAction(title: "OK",
           style: .default, handler:
           scoreAlertDismissed(_:))
        alert.addAction(dismissAction)
        
        present(alert, animated: true,
           completion: nil)
    }
    
    func scoreAlertDismissed(_ action: UIAlertAction) {
        mode = .flashCard
    }
    
    
}

