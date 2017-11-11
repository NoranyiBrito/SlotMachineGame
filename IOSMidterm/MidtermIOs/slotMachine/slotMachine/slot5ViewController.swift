//
//  ViewController.swift
//  slotMachine
//
//  Created by Noranyi Brito on 10/23/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class slot5ViewController: UIViewController {


    @IBOutlet var labels: [UILabel]!
 
    
     @IBOutlet weak var scorelabel: UILabel!
    
    private var game = SlotMachineGame()
    private var theScore = 0
    
    @IBAction func reset(_ sender: UIButton) {
        sender.pulsate()
        game.resetGame()
        scorelabel.text = String(100)  //String(game.getScore())
        for element in labels{
            element.text = "0"
            element.textColor = UIColor.white
        }
    
        
        
    }
    
   
    
    @IBAction func spin(_ sender: UIButton) {
        sender.pulsate()
        
        theScore = Int(scorelabel.text!)!
        theScore -= 2
        scorelabel.text = String(theScore)
        game = SlotMachineGame(5)
        
        var arrayOfDigit = game.getDigits()
        for index in labels.indices {
            labels[index].text = String(arrayOfDigit[index].getDigit())
            labels[index].textColor = arrayOfDigit[index].getColor()
            
        }
        
        let score = game.getScore()
        scorelabel.text = String(theScore + score)
        if (Int(scorelabel.text!))!  < 2 {
            sender.isEnabled = false
        }
    }
}

