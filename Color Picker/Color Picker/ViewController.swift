//
//  ViewController.swift
//  Color Picker
//
//  Created by Aiden on 11/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBAction func reset(_ sender: Any) {
        greenSlider.value = 1
        redSlider.value = 1
        blueSlider.value = 1
        if redSwitch.isOn {
           redSwitch.isOn = false
        }
        if greenSwitch.isOn {
           greenSwitch.isOn = false
        }
        if blueSwitch.isOn {
           blueSwitch.isOn = false
        }
        updateColor()
    }
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green,
           blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    override func viewDidLoad() {
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor =
           UIColor.black.cgColor
        super.viewDidLoad()
        updateColor()
        
        // Do any additional setup after loading the view.
    }


    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
        viewDidLoad()
        }
    @IBAction func sliderChanged(_ sender: Any) {
        updateColor()

    }
}





