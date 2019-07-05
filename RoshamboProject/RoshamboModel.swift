//
//  RoshamboModel.swift
//  RoshamboProject
//
//  Created by mac on 05/07/2019.
//  Copyright © 2019 CBC GEDU. All rights reserved.
//

import Foundation


//Creating an enum that will represent a move

enum RoshamboModel{
    case paper, rock, scissor
    
    //determines the random move
    
    init(){
        switch arc4random() % 3 {
        case 0:
            self = .paper
        case 1:
            self = .rock
            
        default:
            self = .scissor
        }
    }
    
    //Determining how the move should go
    
    func move(opponentmove: RoshamboModel) -> Bool {
        switch (self, opponentmove) {
        case (.rock, .paper), (.scissor, .paper), (.rock, .scissor):
            return true;
        default:
            return false;
        }
    }
}
//convertin an instance to a string
extension RoshamboModel: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .paper:
                return "Paper"
            case .rock:
                return "Rock"
            case .scissor:
                return "Scissor"
            }
        }
    }
}
