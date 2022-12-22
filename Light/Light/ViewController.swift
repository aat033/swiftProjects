//
//  ViewController.swift
//  Light
//
//  Created by Aiden on 11/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightButton: UIButton!
    
    var lightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black

    }
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
}


 
