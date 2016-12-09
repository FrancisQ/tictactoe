//
//  Game.swift
//  tictactoe
//
//  Created by Francis Quintal on 2016-11-02.
//  Copyright © 2016 Francis Quintal. All rights reserved.
//

import Foundation

class Game{
    
    var turn : Bool = true
    var played: [String] = ["","","","","","","","",""]

    var count: [Int] = [0,0,0,0,0,0,0,0,0]

    
    init()
    {
        let rand = arc4random_uniform(UInt32(2))
        if(rand == 0 ){ turn = true}
        else{turn = false}
    }
    
    func getTurn()->String
    {
        
        if (turn == true)
        {
            return "O"
        }
        else
        {
            return "X"
        }
    }
    
    func checkClickedOK(_ num: Int)->Bool
    {
        //check if clicked
        if(count[num] == 1)
        {
            return false
        }else{
            count[num] = 1
            return true
        }
    }
    
    func playMade(_ position: Int){
        if (turn == true){
            played[position] = "O"
            turn = false
        }else if(turn == false ){
            played[position] = "X"
            turn = true
        }

    }
    
    func CheckWin()->Bool
    {
        //top 3
        if(played[0] == played[1] && played[1] == played[2] && played[1] != "")
        {
            return true
        //center 3
        }else if(played[3] == played[4] && played[4] == played[5] && played[4] != "")
        {
            return true
        //bottom 3
        }else if(played[6] == played[7] && played[7] == played[8] && played[7] != "")
        {
            return true
        //left 3
        }else if(played[0] == played[3] && played[3] == played[6]  && played[3] != "")
        {
            return true
        //middle 3
        }else if(played[1] == played[4] && played[4] == played[7] && played[4] != "")
        {
            return true
        //right 3
        }else if(played[2] == played[5] && played[5] == played[8] && played[5] != "")
        {
            return true
        //across 1
        }else if(played[0] == played[4] && played[4] == played[8] && played[4] != "")
        {
            return true
        //across 2
        }else if(played[6] == played[4] && played[4] == played[2] && played[4] != "")
        {
            return true
        }
            return false
    }
    
    func CheckTie()->Bool{
        
        for i in played{
            if(i == ""){
                return false;
            }
        }
        
            return true;
    }
    
    func gameReset(){
        played = ["","","","","","","","",""]
        count = [0,0,0,0,0,0,0,0,0]
    }
    
   }
