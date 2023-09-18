//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    //IBOutet is used to reference UI element
    //Used in Interface Builder to connect user interface elements to code
    
    @IBOutlet weak var secondDiceImageView: UIImageView!
    @IBOutlet weak var firstDiceImageView: UIImageView!
    var imageNames = ["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WHO             //WHAT     //VALUE
        //firstDiceImageView.image = UIImage(named: "DiceSix")
        //secondDiceImageView.image = UIImage(named: "DiceOne")
        //secondDiceImageView.alpha = 0.5
         
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        firstDiceImageView.image = UIImage(named: imageNames.randomElement()!)
        secondDiceImageView.image = UIImage(named: imageNames.randomElement()!)
        
    }
    
}

