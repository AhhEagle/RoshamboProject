//
//  ResultViewController.swift
//  RoshamboProject
//
//  Created by mac on 03/07/2019.
//  Copyright © 2019 CBC GEDU. All rights reserved.
//

import UIKit

// The enum "Shape" represents a play or move
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

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultButton: UILabel!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        displayResult()
    }
    
    // When the ResultViewController is initialized a userChoice is passed in and an opponent's play is generated.
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
    }
    
   
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
