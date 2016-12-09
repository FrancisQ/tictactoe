//
//  ViewController.swift
//  tictactoe
//
//  Created by Francis Quintal on 2016-11-02.
//  Copyright © 2016 Francis Quintal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Board: UIImageView!
    @IBOutlet weak var turn: UILabel!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var winText: UILabel!
    
    //buttons
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topMid: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var centerLeft: UIButton!
    @IBOutlet weak var centerMid: UIButton!
    @IBOutlet weak var centerRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomMid: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    let game = Game()
    var scoreOfX : Int = 0
    var scoreOfO : Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NewGame(newGameButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //reset game
    @IBAction func NewGame(_ sender: AnyObject) {
        //reset score
        scoreOfO = 0
        scoreOfX = 0
        oScore.text = "O: "+String(scoreOfO)
        xScore.text = "X: "+String(scoreOfX)
        
        
        reset()
        
    }
    
    func reset(){
        //get persons score
        var result:String
        result = game.getTurn()
        turn.text = result + "'s Turn"
        

        
        //clear all x/o images
        let imgs = [topLeft, topMid, topRight, centerLeft, centerMid, centerRight, bottomLeft, bottomMid, bottomRight]
        
        for item in imgs{
            item?.setBackgroundImage(UIImage(named: ""), for: UIControlState.normal)
        }
        
        game.gameReset()
    }

    @IBAction func play(_ sender: UIButton)
    {
        //remove Win text
        winText.text = ""
        
        var playing: String
        playing = game.getTurn()
       
        //get which button was clicked to update board
        let imgs = [topLeft, topMid, topRight, centerLeft, centerMid, centerRight, bottomLeft, bottomMid, bottomRight]
        var butClicked: Int = -100
        var i : Int = 0
        while( i < imgs.count){
            if(sender == imgs[i]){
                butClicked = i
            }
            i+=1
        }
        
        
        let good = game.checkClickedOK(butClicked)
        
        if good {
            game.playMade(butClicked)
            
            //add image to spot
            sender.setBackgroundImage(UIImage(named: playing.lowercased()), for: UIControlState.normal)
            
            //change text of turn After having played!
            if playing == "X" {
                turn.text = "O's Turn"
            }else if playing == "O" {
                turn.text = "X's Turn"
            }

        }else{
            winText.text = "Nice Try, Can't Change it!"
        }
        //check if someone wins
        var win: Bool = false
        var tie: Bool = false
        
        win = game.CheckWin()
        tie = game.CheckTie()
        
        //update board for win
        if win {
            winText.text = playing + " Wins"
            if playing == "X" {
                scoreOfX += 1
                xScore.text = "X:" + String(scoreOfX)
                
                reset()
            }
            if playing == "O" {
                scoreOfO += 1
                oScore.text = "O:" + String(scoreOfO)
                game.gameReset()
                reset()
            }
           
        }else if tie{
            winText.text = "TIE GAME, Try again!"
            reset()
        }
        
        
        
        
        
        
        
    }
    

}

