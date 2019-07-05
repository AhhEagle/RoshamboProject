//
//  ResultHistory.swift
//  RoshamboProject
//
//  Created by mac on 05/07/2019.
//  Copyright © 2019 CBC GEDU. All rights reserved.
//

import Foundation
//Saving the match result history
struct ResultHistory {
    
    let p1: RoshamboModel
    let p2: RoshamboModel
    
    init(p1: RoshamboModel, p2: RoshamboModel) {
        self.p1 = p1
        self.p2 = p2
    }
    
    //method to determine Winner
    var winner: RoshamboModel {
        get {
            return p1.move(opponentmove: p2) ? p1 : p2
        }
    }
    
    var loser: RoshamboModel {
        get {
            return p1.move(opponentmove: p2) ? p2 : p1
        }
    }
}
