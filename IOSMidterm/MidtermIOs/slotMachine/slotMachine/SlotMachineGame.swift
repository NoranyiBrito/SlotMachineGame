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
    
    private var score = 0
    private var arrayOfDigits = [Digit]()
    
    
    init(){
    }
    
    
    //This method spins all the Digits that are part of this game.
    func spinDigits() {
        let SlotDigit = Digit()
        SlotDigit.spinDigit()
        arrayOfDigits.append(SlotDigit)
        
    }
    
    //This method verify if there are maches and add points to the score.
    private func checkForWinner(digitNumber: Int){
        
        
        var counterx = 0
        var countery = 0
        
        if let firstElement = arrayOfDigits.first {
            for element in arrayOfDigits {
                if element.getDigit() != firstElement.getDigit() {
                    break
                } else {
                    counterx += 1
                }
            }
            if counterx == digitNumber{
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
                    countery += 1
                }
            }
            if countery == digitNumber{
                if (digitNumber == 3){
                    self.score += 75
                } else if (digitNumber == 5){
                    self.score += 125
                }
            }
        }
        
        if (counterx == digitNumber && countery == digitNumber ){
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
            print(score)
        default:
            var i = 1
            while i <= 3 {
                spinDigits()
                i += 1
                
            }
            // print(score)
            checkForWinner(digitNumber: numberOfDigits)
        }
        
    }
    
    
    
    //Resets to game to beginning with a score of 100.
    func resetGame() {
        self.score = 100
        arrayOfDigits.removeAll()
        
    }
    
    //resturn current score
    func getScore() -> Int{
        return score
        
    }
    
    
    //Returns the game's array of Digits.
    func getDigits() -> [Digit] {
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
