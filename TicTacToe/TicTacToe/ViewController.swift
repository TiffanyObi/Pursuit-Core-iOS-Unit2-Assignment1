//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameButtons: [GameButton]!
    
    @IBOutlet weak var playersTurn: UILabel!
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    playersTurn.text = "Player One's Turn"
        
  }

    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        print("row\(gameButton.row) at column \(gameButton.col) was selected")
        playersTurns()
    }
    
    func playersTurns () {
        var playerTwosTurn = true
        
        playerTwosTurn.toggle()
        
        if playerTwosTurn == true {
            playersTurn.text = "Player Two's Turn"
        } else if playerTwosTurn == false { playersTurn.text = "Player One's Turn"
    }

}

}
