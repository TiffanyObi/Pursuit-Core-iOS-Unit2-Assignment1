//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var playerGo = 1
    
    
    @IBOutlet weak var playersTurn: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playersTurn.text = "Player One's Turn"
        
    }
    
    @IBAction func switchPlayersTurn(_ sender: UIButton) {
        
        playersChangeTurns()
        print(playerGo)
        printXorO(sender:sender)
        appendTag(sender: sender)
        displayWinner()
        
    }
    
    
    
    func playersChangeTurns (){
        if playerGo % 2 == 0 {
            playersTurn.text = "Player Two's Turn"
            playerGo += 1} else if playerGo % 2 == 1 {
            playersTurn.text = "Player One's Turn"
            playerGo += 1
        }
    }
    
    
    func printXorO (sender:UIButton) {
        
        if playersTurn.text == "Player One's Turn" {
            sender.setBackgroundImage(UIImage(named: "xmark"), for: UIControl.State.normal)
            
            
            
        } else if playersTurn.text == "Player Two's Turn" {
            sender.setBackgroundImage(UIImage(named:
                "circle"), for: UIControl.State.normal)
            
            
        }
    }
    
    
    func appendTag (sender:UIButton) {
        if playersTurn.text == "Player Two's Turn" {
            oWins.append(sender.tag)
            sender.isEnabled = false
            print(oWins)
            
            
            
        } else if playersTurn.text == "Player One's Turn" {
            xWins.append(sender.tag)
            sender.isEnabled = false
            print(xWins)
        }
    }
    
    
    
    
    func displayWinner () {
        for group in winningCombos {
            
            if xWins.contains(group[0]) && xWins.contains(group[1]) && xWins.contains(group[2])  {
                playersTurn.text = " X Wins!!! "
            } else if oWins.contains(group[0]) && oWins.contains(group[1]) && oWins.contains(group[2]) {
                playersTurn.text = " O Wins !!! "
            }
        }
        
    }
    
}





