//
//  Digit.swift
//  slotMachine
//
//  Created by Noranyi Brito on 10/23/17.
//  Copyright © 2017 Noranyi Brito. All rights reserved.
//

import Foundation
import UIKit

class SlotMachineGame{
    
    private var score = 100
    private var arrayOfDigits = [Digit]()
    
    
    
    
       
    //This method spins all the Digits that are part of this game.
    func spinDigits() {
       score -= 2
        let SlotDigit = Digit()
        SlotDigit.spinDigit()
        arrayOfDigits.append(SlotDigit)
        
    }
    
    func checkForWinner(digitNumber: Int){
   
        var x = 0
        var y = 0
        
        if let firstElement = arrayOfDigits.first {
            for element in arrayOfDigits {
                if element.getDigit() != firstElement.getDigit() {
                    break
                } else {
                    x += 1
                }
            }
            if x == digitNumber{
                if (digitNumber == 3){
                self.score += 150
                } else if (digitNumber == 5){
                   self.score += 250
            }
        }
        
        }
        if let firstElement = arrayOfDigits.first {
            for element in arrayOfDigits {
                if element.getColor() != firstElement.getColor() {
                    break
                } else {
                    y += 1
                }
            }
            if y == digitNumber{
                if (digitNumber == 3){
                    self.score += 75
                } else if (digitNumber == 5){
                    self.score += 125
                }
            }
        }
        
        if (x == digitNumber && y == digitNumber ){
            if (digitNumber == 3){
                self.score += 300
            } else if (digitNumber == 5){
                self.score += 500
            }
            }
        
        
    }
    
    
    //itializes a new game with the specified number of digits.
    init(_ numberOfDigits : Int) {

       switch numberOfDigits {
        
        case 5:
            var i = 1
           while i <= 5 {
            spinDigits()
            i += 1
            
        }
         checkForWinner(digitNumber: numberOfDigits)
        
        default:
            var i = 1
            while i <= 3 {
                spinDigits()
                i += 1
        
        }
         checkForWinner(digitNumber: numberOfDigits)
        }
        
    }
    
    
    
    //Resets to game to beginning with a score of 100.
    func resetGame() {
        score = 100
        
    }
    
    //resturn current score
    func getScore() -> Int{
     

      
        
        return score
        
    }
    
    
    //Returns the game's array of Digits.
    func getDigits() -> [Digit] {
        score -= 2
      return arrayOfDigits
     }
    
 
    
    class Digit{
        
        private var digit = UInt32()
        private var color = UIColor()
        
       
        init(){
            
        }
        
    //This method randomly selects a digit from 0-9 and sets it's color.
   func spinDigit(){
    
         digit = pickDigit()
         color = pickColor()
    
    }
    
    //This method randomly selects a digit and returns it.
    func pickDigit() -> UInt32 {
        return arc4random_uniform(10)
    }
    
    //This method randomly selects a color and returns it.
    func pickColor() -> UIColor {
        
        let color = arc4random_uniform(4)
        switch color{
        case 0:
            return UIColor.green
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.purple
        default:
            return UIColor.red
        }
    
    }
    
    //This method returns the current digit.
    func getDigit() -> UInt32 {
        return digit
    
    }
    
    //This method returns the current color.
    func getColor() -> UIColor {
    return color
    }
    
    }
}
