//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    
    @IBOutlet weak var playersTurn: UILabel!
    
    @IBOutlet weak var player1ScoreLabel: UILabel!
    
    @IBOutlet weak var player2ScoreLabel: UILabel!
   
    
      var playerGo = 1
      
      var xscore = 0
      var oscore = 0
    
     var allButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
  playerGo = 1
        
        
    }
    
    func disableAllButtons() {
        let buttons = [button1,button2,button3,button4,button5,button6,button7,button8,button9]
        
        for button in buttons {
            button?.isEnabled = false
        }
        
        xWins = []
        oWins = []
        
        playerGo = 1
        
    }
    
    func enableAllButtons() {
        
           let buttons = [button1,button2,button3,button4,button5,button6,button7,button8,button9]
           
           for button in buttons {
            
            button?.setBackgroundImage(nil, for: .normal)
            
               button?.isEnabled = true
           }
        xWins = []
        oWins = []
        playerGo = 1
       }
    
    @IBAction func switchPlayersTurn(_ sender: UIButton) {
        
        playersChangeTurns()
        print(playerGo)
        printXorO(sender:sender)
        appendTag(sender: sender)
        displayWinner(sender: sender)
        
    }
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
         playersTurn.text = "Begin !"
         enableAllButtons()
        
    }
    
    
    @IBAction func resetGameButton(_ sender: UIButton) {
        playersTurn.text = "Begin !"
        enableAllButtons()
        xscore = 0
        player1ScoreLabel.text = "Player 1 = \(xscore)"
        oscore = 0
        player2ScoreLabel.text = "Player 2 = \(oscore)"
    }
    
    func playersChangeTurns (){
        if playerGo % 2 == 0 {
            playersTurn.text = "Player Two's Turn"
            
        }
        if playerGo % 2 == 1 {
            playersTurn.text = "Player One's Turn"
        }
    }
    
    
    func printXorO (sender:UIButton) {
        
        if playerGo % 2 == 1 {
            sender.setBackgroundImage(UIImage(named: "xmark"), for: UIControl.State.normal)
            playersTurn.text = "Player Two's Turn"
             playerGo += 1
        } else if  playerGo % 2 == 0 {
            sender.setBackgroundImage(UIImage(named:
                "circle"), for: UIControl.State.normal)
            playersTurn.text = "Player One's Turn"
             playerGo += 1
        }
    }
    
    
    func appendTag (sender:UIButton) {
        if playerGo % 2 == 1 {
            oWins.append(sender.tag)
            sender.isEnabled = false
            print(oWins)
        }
        
        if playerGo % 2 == 0{
            xWins.append(sender.tag)
            sender.isEnabled = false
            print(xWins)
        }
    }
    
    
    
    
    func displayWinner (sender:UIButton) {
          
        for group in winningCombos {
            
            if xWins.contains(group[0]) && xWins.contains(group[1]) && xWins.contains(group[2])  {
                playersTurn.text = " X Wins!!! "
                xscore += 1
                player1ScoreLabel.text = "Player 1 = \(xscore)"
                disableAllButtons()
            } else if oWins.contains(group[0]) && oWins.contains(group[1]) && oWins.contains(group[2]) {
                playersTurn.text = " O Wins !!! "
                oscore += 1
                player2ScoreLabel.text = "Player 2 = \(oscore)"
                disableAllButtons()
            }
        }
        
    }
    
}





