//
//  ViewController.swift
//  Multiples
//
//  Created by Arti Annaswamy on 6/18/16.
//  Copyright © 2016 Arti Annaswamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    // Properties
    
    var maxAdds = 100
    var varToAdd = 0
    var currentAdds = 0
    var origAdds = 0
    
    // Outlets
    
    @IBOutlet weak var logoMultiples: UIImageView!
    @IBOutlet weak var gameInstructions: UILabel!
    @IBOutlet weak var displayTheMultiple: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pickTheMultiple: UIStepper!
    
    @IBOutlet weak var calcText: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetText: UILabel!
    
    // Actions
    
    @IBAction func onPlayBtnPressed(sender:UIButton!) {
        logoMultiples.hidden = true
        gameInstructions.hidden = true
        pickTheMultiple.hidden = true
        playButton.hidden = true
        displayTheMultiple.hidden = true
        calcText.hidden = false
        addButton.hidden = false
        resetText.hidden = false
        
        varToAdd = Int(displayTheMultiple.text!)!
    }
    
    @IBAction func stepperAction(sender: UIStepper) {
        self.displayTheMultiple.text = "\(Int(sender.value))"
    }

    @IBAction func onAddPressed(sender: UIButton) {
        origAdds = currentAdds
        currentAdds += varToAdd
        calcText.text = "\(origAdds) + \(varToAdd) = \(currentAdds)"
       
        if isGameOver() {
            restartGame()
        }
    }
    
    // Functions
    
    func restartGame() {
        if isGameOver() {
            logoMultiples.hidden = false
            gameInstructions.hidden = false
            pickTheMultiple.hidden = false
            playButton.hidden = false
            displayTheMultiple.hidden = false
            calcText.hidden = true
            addButton.hidden = true
            resetText.hidden = true
            
            currentAdds = 0
            origAdds = 0
            calcText.text = "Click 'Add' to start!"
        }
    }
    
    
    func isGameOver() -> Bool {
        if currentAdds >= maxAdds {
            return true
        } else {
            return false
        }
    }
    
    
    // Default code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

