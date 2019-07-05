//
//  ResultViewController.swift
//  RoshamboProject
//
//  Created by mac on 03/07/2019.
//  Copyright © 2019 CBC GEDU. All rights reserved.
//

import UIKit

// The enum "Shape" represents a play or move
/*
enum Picture: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Picture {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Picture(rawValue: shapes[randomChoice])!
    }
}
 */

class ResultViewController: UIViewController {
    
    var match: ResultHistory!
    var message: NSString!
    var picture: UIImage!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.text = messageDisplayed(match)
        self.resultImage.image = imageDisplayed(match)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5)
        {
            self.resultImage.alpha = 1.5;
        }
    }
    
    func messageDisplayed(_ match: ResultHistory) -> String {
        
        // tie
        if match.p1 == match.p2 {
            return "Retry: It's a tie!"
        }
        
        // other messagesto be displayed
        return match.winner.description + " " + youWin(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: ResultHistory) -> String {
        return match.p1.move(opponentmove: match.p2) ? "You Win!" : "You Lose!"
    }
    
    
    func youWin(_ pressed: RoshamboModel) -> String {
        switch (pressed) {
        case .paper:
            return "waoooo"
        case .rock:
            return "You rock"
        case .scissor:
            return "Great"
        
        }
    }
    
    func imageDisplayed(_ match: ResultHistory) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .paper:
            name = "PaperCoversRock"
        case .rock:
            name = "RockCrushesScissors"
        case .scissor:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }

    

    // When the ResultViewController is initialized a userChoice is passed in and an opponent's play is generated.
    /*
    var userChoice: Picture!
    private let systemChoice: Picture = Picture.randomShape()
    
    
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(systemChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, systemChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(systemChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(systemChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultButton.text = text
    }*/
    
   
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
