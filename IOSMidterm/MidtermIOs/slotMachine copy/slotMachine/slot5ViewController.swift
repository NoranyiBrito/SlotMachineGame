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
    
    private var game = SlotMachineGame(5)
    
    @IBAction func reset(_ sender: UIButton) {
    game.resetGame()
            for element in labels{
            element.text = "0"
            element.textColor = UIColor.white
              //  spin().isEnable = true
                
                
        }
        
        
    }
    
   
    
    @IBAction func spin(_ sender: UIButton) {
       
        game = SlotMachineGame(5)
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
}

