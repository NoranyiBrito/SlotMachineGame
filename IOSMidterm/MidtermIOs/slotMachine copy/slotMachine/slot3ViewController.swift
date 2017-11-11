//
//  ViewController.swift
//  slotMachine
//
//  Created by Noranyi Brito on 10/23/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import UIKit

class slot3ViewController: UIViewController {

    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var spin: UIButton!
    
    private var game = SlotMachineGame(3)
    
    
    @IBAction func spin(_ sender: UIButton) {
        sender.pulsate()
        
        var arrayOfDigit = game.getDigits()
        for index in labels.indices {
            labels[index].text = String(arrayOfDigit[index].getDigit())
            labels[index].textColor = arrayOfDigit[index].getColor()
            
        }
        
        let score = game.getScore()
   
        
       scorelabel.text = String(score)
        if score < 2 {
        sender.isEnabled = false
       }
        
        
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        game.resetGame()
        spin.isEnabled = true
        scorelabel.text = String(100)  //String(game.getScore())
        for element in labels{
            element.text = "0"
            element.textColor = UIColor.white
        }
    }
}
